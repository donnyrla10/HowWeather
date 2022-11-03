//
//  Daily.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import Foundation

struct Daily : Codable {
    struct Temp: Codable {
        let min: Double
        let max: Double
    }
    let dt: Int
    let temp: Temp
    let weather: Weather
    let rain: Double
}
