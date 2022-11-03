//
//  Hourly.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import Foundation

struct Hourly: Codable {
    let dt: Int
    let temp: Double
    let weather: Weather
    
    init(dt: Int, temp: Double, weather: Weather){
        self.dt = dt
        self.temp = temp
        self.weather = weather
    }
}
