//
//  HourlyView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct HourlyView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(red: 178/255, green: 204/255, blue: 255/255))
                .frame(width: 55, height: 110)
            VStack(spacing: 4){
                Text("00")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                Image("02d")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text("12º")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.leading, 4)
            }
        }
    }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
    }
}
