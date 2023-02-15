//
//  WeatherModel.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2023-02-02.
//  Inspired by Emely Kara

import Foundation

struct WeatherResponse: Decodable {
    var currentWeather: CurrentWeather
    var daily: Daily
}

struct CurrentWeather: Decodable {
    var temperature: Float
    var windSpeed: Float
    var weatherCode: Int
    var time: String
    
    enum CodingKeys: String, CodingKey {
        case temperature
        case windSpeed = "windspeed"
        case weatherCode = "weathercode"
        case time
    }
}

struct Daily: Decodable, Hashable {
    var dates: [String]
    var weatherCodes: [Int]
    var maxTemperatures: [Float]
    var minTemperatures: [Float]
    
    enum CodingKeys: String, CodingKey {
        case dates = "time"
        case weatherCodes = "weathercode"
        case maxTemperatures = "temperature_2m_max"
        case minTemperatures = "temperature_2m_min"
    }
}
