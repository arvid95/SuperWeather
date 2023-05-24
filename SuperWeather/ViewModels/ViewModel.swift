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
    @Published var weatherImage = ""
    @Published var todaysDate: Date?
    @Published var forecast = Daily(dates: ["DefaultDate0", "DefaultDate1", "DefaultDate2", "DefaultDate3", "DefaultDate4", "DefaultDate5", "DefaultDate6"], weatherCodes: [0, 1, 2, 3, 4, 5, 6], maxTemperatures: [0, 1, 2, 3, 4, 5, 6], minTemperatures: [0, 1, 2, 3, 4, 5, 6])
    @Published var cityResultList: CityResultList
    @Published var selectedCity = ""
    @Published var favoriteCities: [FavoriteCity] = []
    private var defaultLocation: CLLocation
    private var weatherManager: WeatherManager
    
    public init() {
        self.cityResultList = CityResultList(results: [CityResultList.CityInfo(name: "", countryCode: "", latitude: 0, longitude: 0, country: "")])
        self.weatherManager = WeatherManager()
        self.weatherResponse = WeatherResponse(currentWeather: CurrentWeather(temperature: 0, windSpeed: 0, weatherCode: 0, time: ""), daily: Daily(dates: [""], weatherCodes: [0], maxTemperatures: [0], minTemperatures: [0]))
        self.defaultLocation = CLLocation(latitude: 57.778674, longitude: 14.164293)
        self.location = defaultLocation
    }
    
    private let weatherCodeToDescription = [
        0: "Clear sky",
        1: "Mainly clear",
        2: "Partly clear",
        3: "Overcast",
        45: "Foggy",
        48: "Rime fog",
        51: "Light drizzle",
        53: "Medium drizzle",
        55: "Dense drizzle",
        56: "Light freezing drizzle",
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
    
    private let weatherCodeToImage = [
        0: "sun.max",
        1: "sun.max",
        2: "cloud.sun",
        3: "cloud",
        45: "cloud.fog",
        48: "cloud.fog",
        51: "cloud.drizzle",
        53: "cloud.drizzle",
        55: "cloud.drizzle",
        56: "cloud.drizzle",
        57: "cloud.drizzle",
        61: "cloud.rain",
        63: "cloud.rain",
        65: "cloud.heavyrain",
        66: "cloud.rain",
        67: "cloud.heavyrain",
        71: "cloud.snow",
        73: "cloud.snow",
        75: "cloud.snow",
        77: "cloud.snow",
        80: "cloud.rain",
        81: "cloud.rain",
        82: "cloud.heavyrain",
        85: "cloud.snow",
        86: "cloud.snow",
        95: "cloud.bolt",
        96: "cloud.bolt.rain",
        99: "cloud.bolt.rain"
    ]
    
    func clearLocationResultList() {
        cityResultList.results.removeAll()
    }
    
    func addCityToList(input: CityResultList.CityInfo) {
        if input.name != "" {
            favoriteCities.append(FavoriteCity(cityName: input.name, latitude: input.latitude, longitude: input.longitude, temperature: input.longitude))
        }
    }
    
    func getImageFromWeatherCode(weatherCode: Int) -> String {
        return weatherCodeToImage[weatherCode] ?? "sun.max"
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
    
    func loadWeather(receivedLocation: CLLocation?, _index: Int?) {
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
                        print("\nViewModel:")
                        print("Dates: \(self.forecast.dates)")
                        print("Date count: \(self.forecast.dates.count)")
                        print("Tomorrow's date: \(self.forecast.dates[1])")
                        print("Weather codes: \(self.forecast.weatherCodes)")
                        print("Weathercode count: \(self.forecast.weatherCodes.count)")
                        self.weatherDescription = self.weatherCodeToDescription[weather.currentWeather.weatherCode] ?? ""
                        self.weatherImage = self.weatherCodeToImage[weather.currentWeather.weatherCode] ?? ""
                        self.todaysDate = Date()
                    }
                } else {
                    print("Could not get weather.")
                }
            }
            
        }
    }
}
