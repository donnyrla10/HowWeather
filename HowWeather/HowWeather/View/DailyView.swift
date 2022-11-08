//
//  WeeklyView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct DailyView: View {
    var data : Forecast

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
//                .fill(.white)
                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                .opacity(0.4)
                .frame(width: UIScreen.main.bounds.width - 60, height: 50)
            HStack{
                Text(data.date.dateFromMilliseconds().day())
                    .frame(width: 44)
                Spacer()
                    Image("\(data.weather[0].icon)")
//                Image("50d")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.leading, 28)
                Spacer()
                HStack(spacing: 5){
                    Text("\(Int(data.main.tempMin))º")
//                    Text("-20º")
                        .frame(width: 36, alignment: .trailing)
                    Text("/")
                    Text("\(Int(data.main.tempMax))º")
//                    Text("-30º")
                        .frame(width: 36, alignment: .leading)
                }
            }
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .semibold))
            .padding(.horizontal, 10)
        }
        .frame(width: UIScreen.main.bounds.width - 60, alignment: .center)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView(data: Forecast.emptyInit())
    }
}
