//
//  ForecastGridItemView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct ForecastGridItemView: View {
    
    let date: String
    let weatherImage: String
    let minTemperature: String
    let maxTemperature: String
    
    var body: some View {
        VStack {
            
            Text(date)
            Image(systemName: weatherImage)
                .font(.system(size: 30))
            Text(minTemperature + "°C to " + maxTemperature + "°C")
            
            
        }
    }
}

struct ForecastGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastGridItemView(date: "2022-12-08", weatherImage: "sun.max", minTemperature: "-10", maxTemperature: "0")
    }
}
