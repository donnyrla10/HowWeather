//
//  Weather.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/03.
//

import Foundation

struct Weather: Codable{
    let main: String
    let description: String
    let icon: String
    
    init(main: String, description: String, icon: String){
        self.main = main
        self.description = description
        self.icon = icon
    }
}
