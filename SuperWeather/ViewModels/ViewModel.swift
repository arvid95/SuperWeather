//
//  ViewModel.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//  Inspired by Emely Kara

import Foundation
import CoreLocation

@MainActor class ViewModel: ObservableObject {
    
    @Published var weatherResponse: WeatherResponse
    @Published var location: CLLocation
    @Published var weatherDescription = ""
    @Published var forecast = Daily(time: [""], temperature2mMax: [0], temperature2mMin: [0])
    @Published var cityResultList: CityResultList
    @Published var selectedCity = ""
    @Published var favoriteCities: [FavoriteCity] = []
    private var defaultLocation: CLLocation
    private var weatherManager: WeatherManager
    
    public init() {
        self.cityResultList = CityResultList(results: [CityResultList.CityInfo(name: "", countryCode: "", latitude: 0, longitude: 0, country: "")])
        self.weatherManager = WeatherManager()
        self.weatherResponse = WeatherResponse(currentWeather: CurrentWeather(temperature: 0, windSpeed: 0, weatherCode: 0, time: ""), daily: Daily(time: [""], temperature2mMax: [0], temperature2mMin: [0]))
        self.defaultLocation = CLLocation(latitude: 57.778674, longitude: 14.164293)
        self.location = defaultLocation
    }
    
    private let weatherCodeMap = [
        0: "Clear sky",
        1: "Mainly clear",
        2: "Partly clear",
        3: "Overcast",
        45: "Foggy",
        48: "Rime fog",
        51: "Light drizzle",
        53: "Medium drizzle",
        55: "Dense drizzle",
        56: "Light reezing drizzle",
        57: "Dense freezing drizzle",
        61: "Slight rain",
        63: "Moderate rain",
        65: "Heavy rain",
        66: "Light freezing Rain",
        67: "Heavy freezing Rain",
        71: "Slight snowfall",
        73: "Moderate snowfall",
        75: "Heavy snofall",
        77: "Snow grains",
        80: "Slight rain showers",
        81: "Moderate rain showers",
        82: "Violent rain showers",
        85: "Slight snow showers",
        86: "Heavy snow showers",
        95: "Thunderstorm",
        96: "Thunderstorm with slight hail",
        99: "Thunderstorm with heavy hail"
    ]
    
    func clearLocationResultList() {
        cityResultList.results.removeAll()
    }
    
    func addCityToList(input: CityResultList.CityInfo) {
        if input.name != "" {
            favoriteCities.append(FavoriteCity(cityName: input.name, latitude: input.latitude, longitude: input.longitude, temperature: input.longitude))
        }
    }
    
    func getDatesArray() -> [String] {
        return weatherResponse.daily.time
    }
    
    func getMaxTempArray() -> [Float] {
        return weatherResponse.daily.temperature2mMax
    }
    
    func getMinTempArray() -> [Float] {
        return weatherResponse.daily.temperature2mMin
    }
    
    func getCityByLocation() {
        weatherManager.searchCity(cityName: selectedCity) { city in
            DispatchQueue.main.async {
                if let input = city {
                    self.cityResultList = input
                } else {
                    print("Could not get searchResults.")
                }
            }
        }
    }
    
    func loadCurrentWeather(receivedLocation: CLLocation?, _index: Int?) {
        if let coordinates = receivedLocation {
            location = coordinates
        } else {
            print("Could not get location. Displaying default location.")
            location = defaultLocation
        }
        weatherManager.loadCurrentWeather(location: location) { receivedWeatherResponse in
            DispatchQueue.main.async {
                if let weather = receivedWeatherResponse {
                    if let index = _index {
                        self.favoriteCities[index].temperature = weather.currentWeather.temperature
                    } else {
                        self.weatherResponse = weather
                        self.forecast = weather.daily
                        self.weatherDescription = self.weatherCodeMap[weather.currentWeather.weatherCode] ?? ""
                    }
                } else {
                    print("Could not get weather.")
                }
            }
            
        }
    }
}
