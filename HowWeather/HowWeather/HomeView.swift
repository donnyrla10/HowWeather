//
//  ContentView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = WeatherViewModel()
    
    var body: some View {
        ZStack{
            Color(red: 190/255, green: 220/255, blue: 255/255)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20){
                    HeaderView()
                        .padding(.vertical, 50)
                    RecommendedClothesView()
                    HourlyForecastView()
                    DailyForecastView()
                    CurrentInfoView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
