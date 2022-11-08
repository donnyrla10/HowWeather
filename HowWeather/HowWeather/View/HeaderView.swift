//
//  HeaderView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct HeaderView: View {
    let currentData : CurrentWeather
    let dailyData : [Forecast]
    let character = ["spring", "summer", "autumn", "winter"] //봄, 여름, 가을, 겨울
    
    var seasonCharacter : String {
        let month = Date().monthly()
        if ("03"..."05") ~= month {
            return character[0]
        }else if ("06"..."08") ~= month {
            return character[1]
        }else if ("09"..."11") ~= month {
            return character[2]
        }else {
            return character[3]
        }
    }
    
    var highTemp : String {
        return Int(currentData.main.temp) > Int(dailyData[0].main.tempMax) ? "\(Int(currentData.main.temp))" : "\(Int(dailyData[0].main.tempMax))"
    }
    
    var lowTemp : String {
        return Int(currentData.main.temp) < Int(dailyData[0].main.tempMin) ? "\(Int(currentData.main.temp))" : "\(Int(dailyData[0].main.tempMin))"
    }
    
    var body: some View {
        HStack(spacing: 24){
            VStack(spacing: 6){
                VStack(spacing: 4){
                    Text("\(currentData.name)") //current city name
                        .font(.system(size: 28, weight: .regular))
                        .lineLimit(2)
                    Text("\(Int(currentData.main.temp))º") //current temp
                        .font(.system(size: 74, weight: .light))
                        .padding(.leading, 10)
                }
                .padding(.leading, 6)
                VStack(spacing: 8){
                    Text("\(currentData.weather[0].description)") //current weather description
                        .lineLimit(2)
                        .font(.system(size: 20, weight: .regular))
                    HStack(spacing: 10){
                        Text("H: \(highTemp)º") //max temp
                        Text("L: \(lowTemp)º")  //min temp
                    }
                    .font(.system(size: 16, weight: .regular))
                }
            }
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .shadow(radius: 4)
            .frame(width: UIScreen.main.bounds.width / 2.6)
            Image(seasonCharacter) //character image
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4.8)
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.trailing, 25)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(currentData: CurrentWeather.emptyInit(), dailyData: [Forecast.emptyInit()])
    }
}
