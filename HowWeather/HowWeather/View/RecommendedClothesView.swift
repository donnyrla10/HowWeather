//
//  RecommendedClothesView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct RecommendedClothesView: View {
    let clothes = ["Coat01", "Hoodie", "Pants", "Shawl"]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(.white) //날씨에 따라 다른 색상
//                .fill(Color(red: 0.449, green: 0.596, blue: 0.918))
                .opacity(0.3)
                .frame(height: 160)
            VStack {
                Text("Recommended Clothes")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                Divider()
                    .padding(.leading, 16)
                    .padding(.bottom, 15)
                HStack(spacing: 36){
                    ForEach(clothes, id: \.self) { cl in
                        VStack(spacing: 2){
                            Image(cl)
                                .resizable()
                                .frame(width: 40, height: 40)
                            Text("\(cl)")
                                .font(.system(size: 14, weight: .medium))
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 50, alignment: .center)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20, alignment: .center)
    }
}

struct RecommendedClothesView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedClothesView()
    }
}
