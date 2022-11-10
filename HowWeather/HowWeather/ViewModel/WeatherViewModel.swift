//
//  WeatherViewModel.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import SwiftUI
import Combine
import CoreLocation

class WeatherViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    let apiService = WeatherAPIService()
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var lastLocation: CLLocation?
    @Published var currentPlacemark: CLPlacemark?
    private let manager = CLLocationManager()

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
    
    override init(){
        authorizationStatus = manager.authorizationStatus
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.first
        getData(lastLocation: lastLocation)
    }

    func retry(){
        stateModel = .loading
        stateCurrent = .loading
        stateForecast = .loading
        getData(lastLocation: lastLocation)
    }
    
    private func getData(lastLocation: CLLocation?){
        apiService.getCurrentWeather(lastLocation: lastLocation) { [weak self] currentWeather, error in
            guard let weather = self else {return}
            if let currentWeather = currentWeather {
                weather.currentWeather = currentWeather
//                print("🚨🚨 get current weather data")
//                print(weather.currentWeather)
                weather.stateCurrent = .success
            }else {
                weather.stateCurrent = .failed
//                print("🚨🚨 failed")
            }
            weather.updateStateView()
        }
        
        apiService.getForecastWeather(lastLocation: lastLocation) { [weak self] forecastWeather, error in
            guard let weather = self else {return}
            if let forecastWeather = forecastWeather {
                weather.hourlyWeather = forecastWeather.list
                weather.dailyWeather = forecastWeather.dailyList
                weather.stateForecast = .success
//                print("🚨🚨 get daily forecast weather data")
//                print(weather.dailyWeather)
            }else {
                weather.stateForecast = .failed
//                print("🚨🚨 failed")
            }
            weather.updateStateView()
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
