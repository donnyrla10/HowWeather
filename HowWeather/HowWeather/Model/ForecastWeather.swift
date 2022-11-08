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
    let list: [Forecast] //0, 3, 6, 9, 12, 15, 18, 21
    
    private enum CodingKeys: String, CodingKey {
        case code = "cod"
        case message
        case list
    }
    
    static func emptyInit() -> ForecastWeather {
        return ForecastWeather(code: "", message: 0, list: [])
    }
    
    var dailyList: [Forecast] {
        var daily: [Forecast] = [] //빈 배열
        var entity : Forecast = Forecast(date: 0, main: Main.emptyInit(), weather: [Weather.emptyInit()])
        
        guard let first = list.first else { //list.first가 nil인 경우, return result == []
            return daily //빈 배열 반환
        }
        
        var nextDay = first.date.dateFromMilliseconds().day() //오늘 요일
        //daily == list의 첫번째 원소 (현재 시각 다음의 +3H인 예측)
//        if first.date.dateFromMilliseconds().day() != Date().day() { //오늘의 요일과 다르다면 (집어넣기)
//            nextDay = first.date.dateFromMilliseconds().day() //내일 요일
//        }
        
        //하나의 day마다 8개의 hour이 들어간다. 그러므로 day를 기준으로 하나만 들어가도록 한다!
        //최고, 최소값을 구하기 위해 -> 같은 요일들을 체크하면서 max, min 찾기
        //icon은 15시 기준으로 정하기
        //요일, 아이콘, 최고/최소 기온
        var maxTmp = -40.0
        var minTmp = 40.0
        for data in list { //앞에서부터 차례대로 list 순회
            if data.date.dateFromMilliseconds().day() == nextDay { //nextDay인 경우
                if entity.date == 0 { entity.date = data.date }
                if data.date.dateFromMilliseconds().Hour() == "15" { //오후 3시의 아이콘을 대표 아이콘으로 사용
                    entity.weather[0].icon = data.weather[0].icon
                } else if data.date.dateFromMilliseconds().Hour() > "15" && entity.weather[0].icon == "" {
                    entity.weather[0].icon = data.weather[0].icon //오후 3시 이후라면 현재 시각의 아이콘을 넣어준다.
                }
                maxTmp = maxTmp < Double(data.main.temp) ? Double(data.main.temp) : maxTmp //같은 요일의 최고 기온 구하기
                minTmp = minTmp > Double(data.main.temp) ? Double(data.main.temp) : minTmp //같은 요일의 최저 기온 구하기
            } else { //다음날 -> 이전 값은 저장해주고,
                entity.main.tempMax = maxTmp
                entity.main.tempMin = minTmp
                daily.append(entity)
                
                maxTmp = Double(data.main.temp) //현재 시각을 max에 일단 넣는다.
                minTmp = Double(data.main.temp) //현재 시각을 min에 일단 넣는다.
                nextDay = data.date.dateFromMilliseconds().day() //오늘 요일 저장
                entity.date = 0
            }
        }
        return daily
    }
}
