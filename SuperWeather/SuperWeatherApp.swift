//
//  SuperWeatherApp.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

@main
struct SuperWeatherApp: App {
    
    @StateObject var viewModel: ViewModel = ViewModel()
    @StateObject var locationManager: LocationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(locationManager)
        }
    }
}
