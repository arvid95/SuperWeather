//
//  ContentView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            CurrentWeatherView(weatherImage: "sun.max",
                               weatherDescription: "Sunny",
                               temperature: "6",
                               todaysDate: Date().formatted(date: .abbreviated, time: .omitted),
                               currentTime: Date().formatted(date: .omitted, time: .shortened))
            .padding()
            
            Spacer()
            
            ForecastView(tomorrowsDate: Date().formatted(date: .abbreviated, time: .omitted), weatherImage: "sun.max", minTemperature: "-15", maxTemperature: "-4")
                .padding()
        }
        .onAppear{
            locationManager.requestLocationUpdates()
        }
        .onChange(of: locationManager.userLocation) { newValue in
            viewModel.loadCurrentWeather(receivedLocation: newValue, _index: nil)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
