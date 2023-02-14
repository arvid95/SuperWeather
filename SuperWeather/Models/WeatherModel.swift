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
    var windspeed: Float
    var weathercode: Int
    var time: String
}

struct Daily: Decodable, Hashable {
    var time: [String]
    var weathercode: [Int]
    var temperature_2m_max: [Float]
    //var temperature_2m_min: [Float]
    
    /*enum CodingKeys: String, CodingKey {
        case temperature2mMax = "temperature_2m_max"
        case temperature2mMin = "temperature_2m_min"
        case time = "time"
    }*/
}
