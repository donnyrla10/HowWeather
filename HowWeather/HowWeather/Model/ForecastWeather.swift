//
//  ForecastWeather.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/04.
//

import Foundation

struct ForecastWeather: Codable {
    let code: String
    let message: Int
    let list: [Forecast]
    
    private enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
        case list
    }
    
    static func emptyInit() -> ForecastWeather {
        return ForecastWeather(code: "", message: 0, list: [])
    }
}
