//
//  HourlyForecastView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct HourlyForecastView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(.white) //날씨에 따라 다른 색상
//                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                .opacity(0.3)
                .frame(height: 200)
            VStack {
                Text("Hourly Forecast")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                Divider()
                    .frame(height: 1.2)
                    .overlay(.white)
                    .padding(.leading, 16)
                    .padding(.top, -4)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 16){
                        ForEach(0...10, id: \.self) { _ in
                            HourlyView()
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 48, height: 130, alignment: .center)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20, alignment: .center)
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView()
    }
}
