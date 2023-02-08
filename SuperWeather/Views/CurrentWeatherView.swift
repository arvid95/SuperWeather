//
//  CurrentWeatherView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State var weatherImage: String
    @State var weatherDescription: String
    @State var temperature: String
    @State var todaysDate: String
    @State var currentTime: String
    
    var body: some View {
        VStack {
            
            Image(systemName: weatherImage)
                .font(.system(size: 80))
            Text(viewModel.weatherDescription)
                .font(.largeTitle)
            Text(temperature + "°C")
                .font(.title)
            Text(todaysDate)
            Text(currentTime)
            
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
