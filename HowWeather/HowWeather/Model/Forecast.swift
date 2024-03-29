//
//  Forecast.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/04.
//

import Foundation

struct Rain3h: Codable {
    let prob: Double
    
    private enum CodingKeys: String, CodingKey {
        case prob = "3h"
    }
    
    static func emptyInit() -> Rain3h {
        return Rain3h(prob: 0.0)
    }
}

struct Forecast: Codable{
    var date: Int
    var main: Main
    var weather: [Weather]
    
    private enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main, weather
    }
    
    static func emptyInit() -> Forecast {
        return Forecast(date: 0, main: Main.emptyInit(), weather: [Weather.emptyInit()])
    }
}

extension Forecast: Identifiable {
    var id : String { //id를 UUID가 아니라 date로 함
        return "\(date)"
    }
}
