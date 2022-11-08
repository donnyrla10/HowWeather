//
//  ContentView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/07.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = WeatherViewModel()

    var body: some View {
        if vm.stateModel == .success {
            HomeView(data: vm.currentWeather, hourly: vm.hourlyWeather, daily: vm.dailyWeather)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
