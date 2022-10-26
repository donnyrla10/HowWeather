//
//  RecommendedClothesView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

struct RecommendedClothesView: View {
    let clothes = ["coat", "hoodie", "pants", "shawl"]
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(.blue) //날씨에 따라 다른 색상
                .opacity(0.2)
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
                                .frame(width: 30, height: 40)
                            Text("\(cl)")
                                .fontWeight(.medium)
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
