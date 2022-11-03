//
//  WeatherModel.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import Foundation

struct Weather : Codable {
    let main: String
    let description: String
    let icon: String
    
    static func emptyInit() -> Weather {
        return Weather(main: "", description: "", icon: "")
    }
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
    
    private enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    static func emptyInit() -> Main {
        return Main(temp: 0.0, feelsLike: 0.0, tempMin: 0.0, tempMax: 0.0, pressure: 0, humidity: 0)
    }
}

struct Rain: Codable {
    let prob: Double
    
    private enum CodingKeys : String, CodingKey {
        case prob = "1h"
    }
    
    static func emptyInit() -> Rain {
        return Rain(prob: 0.0)
    }
}

struct System: Codable{
    let sunrise: Int
    let sunset: Int
    
    static func emptyInit() -> System {
        return System(sunrise: 0, sunset: 0)
    }
}

struct CurrentWeather: Codable {
    let weather: [Weather]
    let main: Main
    let visibility: Int
//    let rain: Rain
    let sys: System
    let name: String
    
    static func emptyInit() -> CurrentWeather {
        return CurrentWeather(
            weather: [Weather.emptyInit()],
            main: Main.emptyInit(),
            visibility: 0,
//            rain: Rain.emptyInit(),
            sys: System.emptyInit(),
            name: ""
        )
    }
}