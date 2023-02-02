//
//  LocationModel.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2023-02-02.
//

import Foundation

struct LocationResultList: Decodable {
    var results: [LocationInfo]
    
    struct LocationInfo: Decodable, Hashable {
        let name: String
        let countryCode: String
        let latitude: Float
        let longitude: Float
        let country: String
    }
}

struct FavoriteLocation {
    let cityName: String
    let latitude: Float
    let longitude: Float
    let temperature: Float
}
