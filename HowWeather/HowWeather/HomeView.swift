//
//  ContentView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/25.
//

import SwiftUI

struct HomeView: View {
    let data : CurrentWeather
    let hourly: [Forecast]
    let daily: [Forecast]

    var iconName: String {
        return data.weather[0].icon + "b"
    }
    
    var body: some View {
        ZStack{
//            Image("02db")
            Image(iconName)
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20){
                    HeaderView(currentData: data)
                        .padding(.vertical, 40)
                    RecommendedClothesView()
                    HourlyForecastView(hourly: hourly)
                    DailyForecastView(daily: daily)
                    CurrentInfoView(currentData: data)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(data: CurrentWeather.emptyInit(), hourly: [Forecast.emptyInit()], daily: [Forecast.emptyInit()])
    }
}
