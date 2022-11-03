//
//  WeatherViewModel.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import Foundation

class WeatherViewModel: ObservableObject {
    let apiService = WeatherAPIService()
    
    var currentWeather = CurrentWeather.emptyInit() {
        willSet {
            objectWillChange.send()
        }
    }
    
    var hourlyWeather : [Forecast] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    init(){
        getData()
    }
    
    private func getData(){
        apiService.getCurrentWeather() { [weak self] currentWeather, error in
            guard let weather = self else {return}
            if let currentWeather = currentWeather {
                weather.currentWeather = currentWeather
            }
        }
        
        apiService.getForecastWeather() { [weak self] forecastWeather, errro in
            guard let weather = self else {return}
            if let forecastWeather = forecastWeather {
                weather.hourlyWeather = forecastWeather.list
            }
        }
    }
}
