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
    
    var body: some View {
        
        Grid {
            GridRow {
                //Day 1
                ForecastGridItemView(
                    date: viewModel.forecast.dates[1],
                    weatherImage: viewModel.getImageFromWeatherCode(weatherCode: viewModel.forecast.weatherCodes[1]),
                    minTemperature: viewModel.forecast.minTemperatures[1].formatted(.number.precision(.fractionLength(1))),
                    maxTemperature: viewModel.forecast.maxTemperatures[1].formatted(.number.precision(.fractionLength(1))))
                //Day 2
                ForecastGridItemView(
                    date: viewModel.forecast.dates[2],
                    weatherImage: viewModel.getImageFromWeatherCode(weatherCode: viewModel.forecast.weatherCodes[2]),
                    minTemperature: viewModel.forecast.minTemperatures[2].formatted(.number.precision(.fractionLength(1))),
                    maxTemperature: viewModel.forecast.maxTemperatures[2].formatted(.number.precision(.fractionLength(1))))
            }
            .padding()
            GridRow {
                //Day 3
                ForecastGridItemView(
                    date: viewModel.forecast.dates[3],
                    weatherImage: viewModel.getImageFromWeatherCode(weatherCode: viewModel.forecast.weatherCodes[3]),
                    minTemperature: viewModel.forecast.minTemperatures[3].formatted(.number.precision(.fractionLength(1))),
                    maxTemperature: viewModel.forecast.maxTemperatures[3].formatted(.number.precision(.fractionLength(1))))
                //Day 4
                ForecastGridItemView(
                    date: viewModel.forecast.dates[4],
                    weatherImage: viewModel.getImageFromWeatherCode(weatherCode: viewModel.forecast.weatherCodes[4]),
                    minTemperature: viewModel.forecast.minTemperatures[4].formatted(.number.precision(.fractionLength(1))),
                    maxTemperature: viewModel.forecast.maxTemperatures[4].formatted(.number.precision(.fractionLength(1))))
            }
            .padding()
            GridRow {
                //Day 5
                ForecastGridItemView(
                    date: viewModel.forecast.dates[5],
                    weatherImage: viewModel.getImageFromWeatherCode(weatherCode: viewModel.forecast.weatherCodes[5]),
                    minTemperature: viewModel.forecast.minTemperatures[5].formatted(.number.precision(.fractionLength(1))),
                    maxTemperature: viewModel.forecast.maxTemperatures[5].formatted(.number.precision(.fractionLength(1))))
                //Day 6
                ForecastGridItemView(
                    date: viewModel.forecast.dates[6],
                    weatherImage: viewModel.getImageFromWeatherCode(weatherCode: viewModel.forecast.weatherCodes[6]),
                    minTemperature: viewModel.forecast.minTemperatures[6].formatted(.number.precision(.fractionLength(1))),
                    maxTemperature: viewModel.forecast.maxTemperatures[6].formatted(.number.precision(.fractionLength(1))))
            }
            .padding()
        }
        .padding()
        
    }
    
}

struct ForecastGridView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
