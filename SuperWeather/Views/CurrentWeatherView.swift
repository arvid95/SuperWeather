//
//  CurrentWeatherView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
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
                Text(String(format:"%.1f",viewModel.weatherResponse.currentWeather.windspeed) + "m/s")
            }
            Text(viewModel.todaysDate?.formatted(date: .abbreviated, time: .omitted) ?? "")
            Text(viewModel.todaysDate?.formatted(date: .omitted, time: .shortened) ?? "")
            
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
