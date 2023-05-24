//
//  ForecastGridView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct ForecastGridView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var locationManager: LocationManager
    
    let columns = [
        GridItem(.fixed(175)),
        GridItem(.fixed(175))
    ]
    
    var body: some View {
        
        LazyVGrid(columns: columns) {
            ForEach(1..<7) { index in
                ForecastGridItemView(
                    date: viewModel.forecast.dates[index],
                    weatherImage: viewModel.getImageFromWeatherCode(weatherCode: viewModel.forecast.weatherCodes[index]),
                    minTemperature: viewModel.forecast.minTemperatures[index].formatted(.number.precision(.fractionLength(1))),
                    maxTemperature: viewModel.forecast.maxTemperatures[index].formatted(.number.precision(.fractionLength(1)))
                )
                .padding()
            }
        }
        .padding()
        
    }
    
}

struct ForecastGridView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
