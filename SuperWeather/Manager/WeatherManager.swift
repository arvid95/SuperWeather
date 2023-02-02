//
//  WeatherManager.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2023-02-02.
//

import Foundation
import CoreLocation
import Combine

class WeatherManager: ObservableObject {
    
    private let baseURL = "https://api.open-meteo.com/v1/"
    var weatherResponse: WeatherResponse?
    
    let jsonDecoder = JSONDecoder()
    
    init() {
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
    }
    
    func loadCurrentWeather(location: CLLocation, completion: @escaping(WeatherResponse?)->()) {
        
        let endPoint = "forecast?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&windspeed_unit=ms&timezone=Europe%2FBerlin"
        
        let urlString = baseURL + endPoint
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode < 400 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: WeatherResponse.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] data in
                self?.weatherResponse?.currentWeather = data.currentWeather
                self?.weatherResponse?.daily = data.daily
                completion(data)
            })
    }
}
