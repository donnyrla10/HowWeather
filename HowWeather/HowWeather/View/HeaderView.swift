//
//  HeaderView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 4){
                VStack(spacing: 2){
                    Text("Seoul") //current city name
                        .font(.system(size: 28, weight: .regular))
                        .lineLimit(2)
                    Text("16º") //current temp
                        .font(.system(size: 74, weight: .light))
                }
                VStack(spacing: 6){
                    Text("broken clouds") //current weather description
                        .lineLimit(2)
                        .font(.system(size: 20, weight: .regular))
                    HStack(spacing: 20){
                        Text("H: 17º") //max temp
                        Text("L: 4º")  //min temp
                    }
                    .font(.system(size: 16, weight: .regular))
                }
            }
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .shadow(radius: 4)
            .frame(width: UIScreen.main.bounds.width / 2)

            Image(systemName: "person") //character image
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2.6, height: UIScreen.main.bounds.height / 5)
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
