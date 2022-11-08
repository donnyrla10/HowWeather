//
//  HourlyView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct HourlyView: View {
    var data : Forecast
//
//    var hour: String {
//        var H = data.date.dateFromMilliseconds().hour()
//        let time = ("00"..."11") ~= H ? "AM" : "PM"
//        if H == "00" || H == "24" { H = "12" }
//        if ("13"..."23") ~= H {
//            H = String(Int(H) ?? 0 - 12)
//        }
//        return time + " " + H
//    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
//                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                .opacity(0.4)
                .frame(width: 55, height: 110)
            VStack(spacing: 8){
                Text(data.date.dateFromMilliseconds().hour())
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .medium))
                Image(data.weather[0].icon)
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("\(Int(data.main.temp))º")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.leading, 4)
            }
        }
    }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView(data: Forecast.emptyInit())
    }
}
