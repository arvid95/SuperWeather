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
                ForecastGridItemView(
                    date: viewModel.forecast.dates[1],
                    weatherImage: "sun.max",
                    minTemperature: viewModel.forecast.minTemperatures[1].formatted(),
                    maxTemperature: viewModel.forecast.maxTemperatures[1].formatted())
                ForecastGridItemView(
                    date: viewModel.forecast.dates[2],
                    weatherImage: "sun.max",
                    minTemperature: viewModel.forecast.minTemperatures[2].formatted(),
                    maxTemperature: viewModel.forecast.maxTemperatures[2].formatted())
            }
            .padding()
            GridRow {
                ForecastGridItemView(
                    date: viewModel.forecast.dates[3],
                    weatherImage: "sun.max",
                    minTemperature: viewModel.forecast.minTemperatures[3].formatted(),
                    maxTemperature: viewModel.forecast.maxTemperatures[3].formatted())
                ForecastGridItemView(
                    date: viewModel.forecast.dates[4],
                    weatherImage: "sun.max",
                    minTemperature: viewModel.forecast.minTemperatures[4].formatted(),
                    maxTemperature: viewModel.forecast.maxTemperatures[4].formatted())
            }
            .padding()
            GridRow {
                ForecastGridItemView(
                    date: viewModel.forecast.dates[5],
                    weatherImage: "sun.max",
                    minTemperature: viewModel.forecast.minTemperatures[5].formatted(),
                    maxTemperature: viewModel.forecast.maxTemperatures[5].formatted())
                ForecastGridItemView(
                    date: viewModel.forecast.dates[6],
                    weatherImage: "sun.max",
                    minTemperature: viewModel.forecast.minTemperatures[6].formatted(),
                    maxTemperature: viewModel.forecast.maxTemperatures[6].formatted())
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
