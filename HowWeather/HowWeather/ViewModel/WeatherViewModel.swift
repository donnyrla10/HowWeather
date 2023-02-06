//
//  WeatherViewModel.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import SwiftUI
import Combine
import CoreLocation //위치값을 가져올 수 있는 프레임워크

//CLLocationManagerDelegate: 앱에 사용자 위치 접근 가능
class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let apiService = WeatherAPIService()                        //네트워크 클래스
    @Published var authorizationStatus: CLAuthorizationStatus   //위치 권한 상태
    @Published var lastLocation: CLLocation?                    //마지막 위치
    @Published var currentPlacemark: CLPlacemark?               //현재 위치
    private let manager = CLLocationManager()                   //Location manager 인스턴스: 사용자 좌표 값 얻기 위해 사용하는 매니저

    var stateModel: StateModel = StateModel.loading {
        willSet {
            objectWillChange.send()
        }
    }
    
    var currentWeather = CurrentWeather.emptyInit() {
        willSet {
            objectWillChange.send()
        }
    }
    
    var hourlyWeather : [Forecast] = [] { //forecast 데이터
        willSet {
            objectWillChange.send()
        }
    }
    
    var dailyWeather : [Forecast] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    private var stateCurrent = StateModel.loading
    private var stateForecast = StateModel.loading
    
    //초기화 함수
    override init(){
        authorizationStatus = manager.authorizationStatus
        super.init()
        manager.delegate = self                             //update events를 받을 delegate object를 자신으로 설정
        manager.desiredAccuracy = kCLLocationAccuracyBest   //위치 데이터 정확도(default)
        manager.requestWhenInUseAuthorization()             //위치 정보 사용 허가 팝업창 세팅
        manager.startUpdatingLocation()                     //허가 후, 지속적으로 사용자 위치 추적
    }
    
    //사용자 위치를 추적하는 함수, MKCoordinateRegion을 설정한다.
    //사용자의 마지막 위치에 접근할 수 있다.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.first          //update된 위치(location)중 맨 첫번째꺼로 갱신(가장 최근 위치)
        getData(lastLocation: lastLocation)     //얻은 위치로 weather 데이터 가져오기(API 통신)
    }

    func retry(){
        stateModel = .loading
        stateCurrent = .loading
        stateForecast = .loading
        getData(lastLocation: lastLocation)
    }
    
    //APIService를 통해 얻어온 데이터(currentWeather/forecastWeather)를 Model(CurrentWeather/ForecastWeather)에 데이터 넣기
    private func getData(lastLocation: CLLocation?){
        apiService.getCurrentWeather(lastLocation: lastLocation) { [weak self] currentWeather, error in
            guard let weather = self else {return}
            if let currentWeather = currentWeather {
                weather.currentWeather = currentWeather
                weather.stateCurrent = .success
            }else {
                weather.stateCurrent = .failed
            }
            weather.updateStateView() //상태값 변경
        }
        
        apiService.getForecastWeather(lastLocation: lastLocation) { [weak self] forecastWeather, error in
            guard let weather = self else {return}
            if let forecastWeather = forecastWeather {
                weather.hourlyWeather = forecastWeather.list
                weather.dailyWeather = forecastWeather.dailyList
                weather.stateForecast = .success
            }else {
                weather.stateForecast = .failed
            }
            weather.updateStateView() //상태값 변경
        }
    }

    private func updateStateView() {
        if stateCurrent == .success, stateForecast == .success {
            stateModel = .success
        }
        if stateCurrent == .failed, stateForecast == .failed {
            stateModel = .failed
        }
    }
}
