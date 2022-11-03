//
//  WeatherModel.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import Foundation

struct WeatherModel: Codable {
    let current: Current
    let hourly: [Hourly]
    let daily: [Daily]
    
    init(current: Current, hourly: [Hourly], daily: [Daily]) {
        self.current = current
        self.hourly = hourly
        self.daily = daily
    }
}
