//
//  LocationModel.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2023-02-02.
//  Inspired by Emely Kara

import Foundation

struct CityResultList: Decodable {
    var results: [CityInfo]
    
    struct CityInfo: Decodable, Hashable {
        let name: String
        let countryCode: String
        let latitude: Float
        let longitude: Float
        let country: String
    }
}

struct FavoriteCity {
    let cityName: String
    let latitude: Float
    let longitude: Float
    let temperature: Float
}
