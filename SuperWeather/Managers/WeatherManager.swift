//
//  WeatherManager.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2023-02-02.
//  Inspired by Emely Kara

import Foundation
import CoreLocation
import Combine

class WeatherManager: ObservableObject {
    
    private let baseURL = "https://api.open-meteo.com/v1/"
    var weatherResponse: WeatherResponse?
    var cancellable1: Cancellable?
    var cancellable2: Cancellable?
    let jsonDecoder = JSONDecoder()
    private var cityResultList: CityResultList?
    
    init() {
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        cityResultList = CityResultList(results: [CityResultList.CityInfo(name: "", countryCode: "", latitude: 0, longitude: 0, country: "")])
    }
    
    func searchCity(cityName: String, completion: @escaping(CityResultList?) -> ()) {
        let urlString = "https://geocoding-api.open-meteo.com/v1/search?name=\(cityName)"
        guard let url = URL(string: urlString) else {
            return
        }
        cancellable1 = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode < 400 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: CityResultList.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { [weak self] data in
                self?.cityResultList = data
                completion(data)
            })
    }
    
    func loadCurrentWeather(location: CLLocation, completion: @escaping(WeatherResponse?)->()) {
        
        let endPoint = "forecast?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&windspeed_unit=ms&timezone=Europe%2FBerlin"
        
        let urlString = baseURL + endPoint
        print(urlString)
        
        guard let url = URL(string: urlString) else {
            print(urlString)
            return
        }
        
        cancellable2 = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode < 400 else {
                    throw URLError(.badServerResponse)
                }
                print("\nJson data fetched successfully. Now decoding.\n")
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
