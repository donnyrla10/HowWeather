//
//  WeeklyForecastView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct DailyForecastView: View {
    let daily: [Forecast]
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(.white) //날씨에 따라 다른 색상
//                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                .opacity(0.3)
                .frame(height: 400)
            VStack {
                Text("Daily Forecast")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                Divider()
                    .frame(height: 1.2)
                    .overlay(.white)
                    .padding(.leading, 16)
                    .padding(.bottom, 10)
                VStack(spacing: 16){
                    ForEach(daily) { day in
                        if day.date.dateFromMilliseconds().hour() != Date().day() {
                            DailyView(data: day)
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 300, alignment: .center)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20, alignment: .center)
    }
}

struct DailyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        DailyForecastView(daily: [Forecast.emptyInit()])
    }
}
