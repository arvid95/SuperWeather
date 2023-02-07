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
    let temperature: Float
    let windspeed: Float
    let weathercode: Int
    let time: String
}

struct Daily: Decodable, Hashable {
    let time: [String]
    let temperature2mMax: [Float]
    let temperature2mMin: [Float]
    
    enum CodingKeys: String, CodingKey {
        case temperature2mMax = "temperature2mMax"
        case temperature2mMin = "temperature2mMin"
        case time = "time"
    }
}
