//
//  ForecastView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import SwiftUI

struct ForecastView: View {
    
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
            
            
            ForecastGridView()
            
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
