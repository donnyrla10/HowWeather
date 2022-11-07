//
//  WeatherAPIService.swift
//  HowWeather
//
//  Created by 김영선 on 2022/11/04.
//

import Foundation

class WeatherAPIService {
    //더 공부하기
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, Error?) -> Void
    typealias ForecastWeatherCompletionHandler = (ForecastWeather?, Error?) -> Void
    
    private let apiKEY = "097fc42dcab2e4228227ac8913fb661c"
    private let session: URLSession
    private let decoder = JSONDecoder()
    
    //query: lat, lon
    private func currentWeatherURL(lat: Double, lon: Double, city: String) -> URL {
//        return URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&units=metric&appid=\(apiKEY)")!
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKEY)")!

    }
    
    private func forecastWeatherURL(lat: Double, lon: Double, city: String) -> URL {
//        return URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&units=metric&appid=\(apiKEY)")!
        return URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appid=\(apiKEY)")!

    }
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    //request weatherCurrentAPI
    func getCurrentRequest(completionHandler completion: @escaping( _ object: CurrentWeather?, _ error: Error?) -> ()) {
        let url = currentWeatherURL(lat: 39.31, lon: -74.5, city: "Seoul")
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
    func getForecastRequest(completionHandler completion: @escaping( _ object: ForecastWeather?, _ error: Error?) -> ()) {
        let url = forecastWeatherURL(lat: 39.31, lon: -74.5, city: "Seoul")
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
    
    func getCurrentWeather(completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        getCurrentRequest() { (weather: CurrentWeather?, error) in
            completion(weather, error)
        }
    }
    
    func getForecastWeather(completionHandler completion: @escaping ForecastWeatherCompletionHandler) {
        getForecastRequest() { (weather: ForecastWeather?, error) in
            completion(weather, error)
        }
    }
}
