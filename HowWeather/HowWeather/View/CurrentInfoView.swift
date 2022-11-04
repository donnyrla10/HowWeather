//
//  CurrentInfoView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct CurrentInfoView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(.white) //날씨에 따라 다른 색상
                .opacity(0.3)
                .frame(height: 440)
            VStack {
                Text("Current Information")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                Divider()
                    .padding(.leading, 16)
                    .padding(.bottom, 10)
                VStack(spacing: 10){
                    HStack(spacing: 10){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                                .opacity(0.4)                                .frame(width: UIScreen.main.bounds.width / 2 - 36, height: 110)
                            VStack(spacing: 10){
                                Text("sunrise")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                Text("06:45")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold))
                            }
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                                .opacity(0.4)
                                .frame(width: UIScreen.main.bounds.width / 2 - 36, height: 110)
                            VStack(spacing: 10){
                                Text("sunset")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                Text("19:01")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold))
                            }
                        }
                    }
                    HStack(spacing: 10){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                                .opacity(0.4)
                                .frame(width: UIScreen.main.bounds.width / 2 - 36, height: 110)
                            VStack(spacing: 10){
                                Text("Feels Like")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                Text("11º")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold))
                            }
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                                .opacity(0.4)
                                .frame(width: UIScreen.main.bounds.width / 2 - 36, height: 110)
                            VStack(spacing: 10){
                                Text("visibility")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                Text("10km")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold))
                            }
                        }
                    }
                    HStack(spacing: 10){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                                .opacity(0.4)
                                .frame(width: UIScreen.main.bounds.width / 2 - 36, height: 110)
                            VStack(spacing: 10){
                                Text("pressure")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                Text("3 hPa")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold))
                            }
                        }
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                                .opacity(0.4)
                                .frame(width: UIScreen.main.bounds.width / 2 - 36, height: 110)
                            VStack(spacing: 10){
                                Text("humidity")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                Text("10%")
                                    .foregroundColor(.white)
                                    .font(.system(size: 24, weight: .semibold))
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 20, height: 350, alignment: .center)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20, alignment: .center)
    }
}

struct CurrentInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentInfoView()
    }
}
