//
//  WeatherAPIService.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/04.
//

import Foundation
import SwiftUI
import CoreLocation

class WeatherAPIService {
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    typealias ForecastWeatherCompletionHandler = (ForecastWeather?, Error?) -> Void
    
    private let apiKEY = "097fc42dcab2e4228227ac8913fb661c"
    private let session: URLSession
    private let decoder = JSONDecoder()
    
    //query: suffix, lat, lon
    private func weatherURL(suffix: String, lat: Double, lon: Double) -> URL {
        return URL(string: "https://api.openweathermap.org/data/2.5/\(suffix)?lat=\(lat)&lon=\(lon)&units=metric&appid=\(apiKEY)")!
    }
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    //request weatherCurrentAPI
    //ViewModel에서 얻은 location 값으로
    func getCurrentRequest(lastLocation: CLLocation?, completionHandler completion: @escaping( _ object: CurrentWeather?, _ error: Error?) -> ()) {
        let url = weatherURL(suffix: "weather", lat: lastLocation?.coordinate.latitude ?? 0, lon: lastLocation?.coordinate.longitude ?? 0)
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else { return }
                    if httpResponse.statusCode == 200 {
                        do{
                            let result = try self.decoder.decode(CurrentWeather.self, from: data)
                            print("🌥 current weather Data")
                            print(result)
                            completion(result, nil)
                        } catch let error {
                            print("🚨 error")
                            print(String(describing: error))
                            completion(nil, error)
                        }
                    } else {
                        print("invalid data error")
                    }
                } else if let error = error {
                    print("🚨 error")
                    print(String(describing: error))
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    //request forecastWeatherAPI
    func getForecastRequest(lastLocation: CLLocation?, completionHandler completion: @escaping( _ object: ForecastWeather?, _ error: Error?) -> ()) {
        let url = weatherURL(suffix: "forecast", lat: lastLocation?.coordinate.latitude ?? 0, lon: lastLocation?.coordinate.longitude ?? 0)
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    guard let httpResponse = response as? HTTPURLResponse else { return }
                    if httpResponse.statusCode == 200 {
                        do{
                            let result = try self.decoder.decode(ForecastWeather.self, from: data)
                            print("🌥 forescast Data")
                            print(result)
                            completion(result, nil)
                        } catch let error {
                            print("🚨 error")
                            print(String(describing: error))
                            completion(nil, error)
                        }
                    } else {
                        print("invalid data error")
                    }
                } else if let error = error {
                    print("🚨 error")
                    print(String(describing: error))
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    func getCurrentWeather(lastLocation: CLLocation?, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getCurrentRequest(lastLocation: lastLocation) { (weather: CurrentWeather?, error) in
            completion(weather, error)
        }
    }
    
    func getForecastWeather(lastLocation: CLLocation?, completionHandler completion: @escaping ForecastWeatherCompletionHandler) {
        getForecastRequest(lastLocation: lastLocation) { (weather: ForecastWeather?, error) in
            completion(weather, error)
        }
    }
}
