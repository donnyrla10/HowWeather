//
//  WeatherViewModel.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import SwiftUI
import Combine

class WeatherViewModel: ObservableObject {
    let apiService = WeatherAPIService()
    
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
    
//    var hourlyWeather : [Forecast] = [] {
//        willSet {
//            objectWillChange.send()
//        }
//    }
    
    private var stateCurrent = StateModel.loading
//    private var stateForecast = StateModel.loading
    
    init(){
        getData()
    }
    
    func retry(){
        stateModel = .loading
        stateCurrent = .loading
//        stateForecast = .loading
        getData()
    }
    
    private func getData(){
        apiService.getCurrentWeather() { [weak self] currentWeather, error in
            guard let weather = self else {return}
            if let currentWeather = currentWeather {
                weather.currentWeather = currentWeather
                print("🚨🚨 get current weather data")
                print(weather.currentWeather)
                weather.stateCurrent = .success
            }else {
                weather.stateCurrent = .failed
                print("🚨🚨 failed")
            }
            weather.updateStateView()
        }
        
//        apiService.getForecastWeather() { [weak self] forecastWeather, error in
//            guard let weather = self else {return}
//            if let forecastWeather = forecastWeather {
//                weather.hourlyWeather = forecastWeather.list
//                weather.stateForecast = .success
//            }else {
//                weather.stateForecast = .failed
//            }
//            weather.updateStateView()
//        }
    }
    
    private func updateStateView() {
        if stateCurrent == .success/*, stateForecast == .success*/ {
            stateModel = .success
        }
        if stateCurrent == .failed/*, stateForecast == .failed*/ {
            stateModel = .failed
        }
    }
}
