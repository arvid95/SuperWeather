//
//  ForecastGridView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct ForecastGridView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        Grid {
            GridRow {
                ForecastGridItemView(
                    date: viewModel.forecast.weatherCodes.description,
                    weatherImage: "sun.max",
                    minTemperature: "-12",
                    maxTemperature: "2")
                ForecastGridItemView(
                    date: "2022-12-10",
                    weatherImage: "sun.max",
                    minTemperature: "-12",
                    maxTemperature: "2")
            }
            .padding()
            GridRow {
                ForecastGridItemView(
                    date: "2022-12-09",
                    weatherImage: "sun.max",
                    minTemperature: "-12",
                    maxTemperature: "2")
                ForecastGridItemView(
                    date: "2022-12-09",
                    weatherImage: "sun.max",
                    minTemperature: "-12",
                    maxTemperature: "2")
            }
            .padding()
            GridRow {
                ForecastGridItemView(
                    date: "2022-12-09",
                    weatherImage: "sun.max",
                    minTemperature: "-12",
                    maxTemperature: "2")
                ForecastGridItemView(
                    date: "2022-12-09",
                    weatherImage: "sun.max",
                    minTemperature: "-12",
                    maxTemperature: "2")
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
