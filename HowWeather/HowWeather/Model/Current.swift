//
//  Current.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import Foundation

struct Current: Codable{
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feels_like: Double
    let pressure: Int
    let humidity: Int
    let uvi: Double
    let visibility: Int
    let weather: Weather
    
    init(sunrise: Int, sunset: Int, temp: Double, feels_like: Double, pressure: Int, humidity: Int, uvi: Double, visibility: Int, weather: Weather){
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feels_like = feels_like
        self.pressure = pressure
        self.humidity = humidity
        self.uvi = uvi
        self.visibility = visibility
        self.weather = weather
    }
}
