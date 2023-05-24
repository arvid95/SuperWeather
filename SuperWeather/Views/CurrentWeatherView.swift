//
//  CurrentWeatherView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            
            Image(systemName: viewModel.weatherImage)
                .font(.system(size: 80))
            Text(viewModel.weatherDescription)
                .font(.largeTitle)
            Text(viewModel.weatherResponse.currentWeather.temperature.formatted() + "°C")
                .font(.title)
            HStack {
                Image(systemName: "wind")
                Text(String(format:"%.1f",viewModel.weatherResponse.currentWeather.windSpeed) + "m/s")
            }
            
            HStack {
                VStack {
                    Text(viewModel.todaysDate?.formatted(date: .abbreviated, time: .omitted) ?? "")
                    Text(viewModel.todaysDate?.formatted(date: .omitted, time: .standard) ?? "")
                }
                /*Button() {
                    locationManager.requestLocationUpdates()
                    //print("Refresh button pressed.")
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
                .buttonStyle(.bordered)*/
            }            
        }
        .onAppear{
            locationManager.requestLocationUpdates()
        }
        .onChange(of: locationManager.userLocation) { newValue in
            viewModel.loadWeather(receivedLocation: newValue, _index: nil)
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
