//
//  WeeklyView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct DailyView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 178/255, green: 204/255, blue: 255/255))
                .frame(width: UIScreen.main.bounds.width - 60, height: 50)
            HStack{
                Text("WED")
                Spacer()
                HStack(spacing: 10){
                    Image("10d")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("70%")
                }
                Spacer()
                Text("4º / 10º")
            }
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .semibold))
            .padding(.horizontal, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 60, alignment: .center)
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
