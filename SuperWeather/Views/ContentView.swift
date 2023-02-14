//
//  ContentView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            CurrentWeatherView()
                .padding()
                .environmentObject(viewModel)
                .environmentObject(locationManager)
            
            Spacer()
            
            ForecastGridView()
                .environmentObject(viewModel)
                .environmentObject(locationManager)
        }
        .onAppear{
            locationManager.requestLocationUpdates()
        }
        .onChange(of: locationManager.userLocation) { newValue in
            viewModel.loadWeather(receivedLocation: newValue, _index: nil)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
