//
//  HeaderView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct HeaderView: View {
    let currentData : CurrentWeather
    var body: some View {
        HStack(spacing: 10){
            VStack(spacing: 4){
                VStack(spacing: 2){
                    Text("\(currentData.name)") //current city name
                        .font(.system(size: 28, weight: .regular))
                        .lineLimit(2)
                    Text("\(Int(currentData.main.temp))º") //current temp
                        .font(.system(size: 74, weight: .light))
                }
                VStack(spacing: 6){
                    Text("\(currentData.weather[0].description)") //current weather description
                        .lineLimit(2)
                        .font(.system(size: 20, weight: .regular))
                    HStack(spacing: 20){
                        Text("H: \(Int(currentData.main.tempMax))º") //max temp
                        Text("L: \(Int(currentData.main.tempMin))º")  //min temp
                    }
                    .font(.system(size: 16, weight: .regular))
                }
            }
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .shadow(radius: 4)
            .frame(width: UIScreen.main.bounds.width / 2)
            Image("winter01") //character image
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4.8)
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.trailing, 25)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(currentData: CurrentWeather.emptyInit())
    }
}
