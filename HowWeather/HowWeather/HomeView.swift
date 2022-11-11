//
//  ContentView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var weatherViewModel: WeatherViewModel
    
    let data : CurrentWeather
    let hourly: [Forecast]
    let daily: [Forecast]

    var iconName: String {
        return data.weather[0].icon + "b"
    }
    
    var body: some View {
        ZStack{
            Image("01db")
//            Image(iconName)
                .resizable()
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20){
                    HeaderView(currentData: data, dailyData: daily)
                        .padding(.vertical, 40)
                    RecommendedClothesView(dailyData: daily, currentData: data)
                    HourlyForecastView(hourly: hourly)
                    DailyForecastView(daily: daily)
                    CurrentInfoView(currentData: data)
                }
            }
        }
//        .onAppear {
//            print(locationViewModel.lastLocation?.coordinate.latitude ?? 0)
//            print(locationViewModel.lastLocation?.coordinate.longitude ?? 0)
////            weatherViewModel.getData(lat: locationViewModel.lastLocation?.coordinate.latitude ?? 0, lon: locationViewModel.lastLocation?.coordinate.longitude ?? 0)
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(data: CurrentWeather.emptyInit(), hourly: [Forecast.emptyInit()], daily: [Forecast.emptyInit()])
    }
}
