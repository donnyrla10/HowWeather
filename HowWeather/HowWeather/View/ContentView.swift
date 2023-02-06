//
//  ContentView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = WeatherViewModel() //VM 인스턴스 생성
    var body: some View {
        //네트워킹 성공시 -> HomeView 출력
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
