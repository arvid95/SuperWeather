//
//  ForecastView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct ForecastView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State var tomorrowsDate: String
    @State var weatherImage: String
    @State var minTemperature: String
    @State var maxTemperature: String
    
    var body: some View {
        VStack {
            
            Text("Tomorrow!")
            Text(tomorrowsDate)
                .font(.title2)
            Image(systemName: "sun.max")
                .font(.system(size: 60))
            
            
            Grid {
                GridRow {
                    ForecastGridItemView(date: "2022-12-09", weatherImage: "sun.max", minTemperature: "-12", maxTemperature: "2")
                    ForecastGridItemView(date: "2022-12-10", weatherImage: "sun.max", minTemperature: "-12", maxTemperature: "2")
                }
                .padding()
                GridRow {
                    ForecastGridItemView(date: "2022-12-09", weatherImage: "sun.max", minTemperature: "-12", maxTemperature: "2")
                    ForecastGridItemView(date: "2022-12-09", weatherImage: "sun.max", minTemperature: "-12", maxTemperature: "2")
                }
                .padding()
                GridRow {
                    ForecastGridItemView(date: "2022-12-09", weatherImage: "sun.max", minTemperature: "-12", maxTemperature: "2")
                    ForecastGridItemView(date: "2022-12-09", weatherImage: "sun.max", minTemperature: "-12", maxTemperature: "2")
                }
                .padding()
            }
            .padding()
            
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
