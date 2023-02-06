//
//  RecommendedClothesView.swift
//  HowWeather
//
//  Created by 김영선 on 2022/10/26.
//

import SwiftUI

let clothes = [["paddedjacket", "coat", "shawl", "blackstocking"], //~5
               ["coat", "leatherjacket", "blackstocking"], //6-9
               ["trenchCoat", "jacket", "blackstocking"], //10-11
               ["jacket", "knitnear", "hoodie", "sweatshirt", "longsleeves", "cardigan", "stocking"], //12-16
               ["knitnear", "hoodie", "sweatshirt", "longsleeves", "cardigan", "stocking"], //17-19
               ["longsleeves", "cardigan", "shirt", "hoodie", "tshirt", "shortpants"], //20-22
               ["tshirt", "shortpants", "longsleeves"], //23-26
               ["sleevless", "tshirt", "shortpants"] //27~
              ]

struct RecommendedClothesView: View {
    let dailyData : [Forecast]
    let currentData : CurrentWeather
    
    var highTemp : Int {
        return Int(currentData.main.temp) > Int(dailyData[0].main.tempMax) ? Int(currentData.main.temp) : Int(dailyData[0].main.tempMax)
    }
    
    var lowTemp : Int {
        return Int(currentData.main.temp) < Int(dailyData[0].main.tempMin) ? Int(currentData.main.temp) : Int(dailyData[0].main.tempMin)
    }
    
    var clothesIndex : (Int, Int) {
        var highIndex = 0
        var lowIndex = 0
        switch highTemp {
        case (...5) :
            highIndex = 0
            break
        case (6...9) :
            highIndex = 1
            break
        case (10...11) :
            highIndex = 2
            break
        case (12...16) :
            highIndex = 3
            break
        case (17...19) :
            highIndex = 4
            break
        case (20...22) :
            highIndex = 5
            break
        case (23...26) :
            highIndex = 6
            break
        default:
            highIndex = 7
            break
        }
        
        switch lowTemp {
        case (...5) :
            lowIndex = 0
            break
        case (6...9) :
            lowIndex = 1
            break
        case (10...11) :
            lowIndex = 2
            break
        case (12...16) :
            lowIndex = 3
            break
        case (17...19) :
            lowIndex = 4
            break
        case (20...22) :
            lowIndex = 5
            break
        case (23...26) :
            lowIndex = 6
            break
        default:
            lowIndex = 7
            break
        }
        
        return (highIndex, lowIndex)
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .fill(.white) //날씨에 따라 다른 색상
                .opacity(0.3)
                .frame(height: 160)
            VStack {
                Text("Recommended (High/Low)")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width - 50, alignment: .leading)
                Divider()
                    .frame(height: 1.2)
                    .overlay(.white)
                    .padding(.leading, 16)
                    .padding(.top, -4)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing:22){
                        ForEach(clothes[clothesIndex.0], id: \.self) { recommend in
                            VStack(spacing: 1){
                                Image(recommend)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("\(recommend)")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 60, height: 30, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                            }
                        }
                        Divider()
                            .frame(width: 1.2)
                            .overlay(.white)
                        ForEach(clothes[clothesIndex.1], id: \.self) { recommend in
                            VStack(spacing: 2){
                                Image(recommend)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("\(recommend)")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                                    .frame(width: 60, height: 30, alignment: .center)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                            }
                        }
                    }
                    .padding(.leading, 4)
                }
                .frame(width: UIScreen.main.bounds.width - 50, height: 90, alignment: .center)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 20, alignment: .center)
    }
}

struct RecommendedClothesView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedClothesView(dailyData: [Forecast.emptyInit()], currentData: CurrentWeather.emptyInit())
    }
}
