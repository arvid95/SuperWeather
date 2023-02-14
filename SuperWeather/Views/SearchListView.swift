//
//  SearchListView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2023-02-14.
//

import SwiftUI
import CoreLocation

struct SearchListView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        
        List {
            ForEach(viewModel.favoriteCities.indices, id: \.self) { index in
                HStack {
                    Text(viewModel.favoriteCities[index].cityName)
                    Spacer()
                    Image(systemName: "thermometer.sun.fill")
                    Text(String(format: "%0.f", viewModel.favoriteCities[index].temperature) + "°C")
                }
                .padding(10)
                .font(.title2)
                .onAppear {
                    viewModel.loadWeather(
                        receivedLocation: CLLocation(
                            latitude: CLLocationDegrees(viewModel.favoriteCities[index].latitude),
                            longitude: CLLocationDegrees(viewModel.favoriteCities[index].longitude)),
                        _index: index)
                }
            }.onDelete { indexSet in
                indexSet.forEach { index in
                    viewModel.favoriteCities.remove(at: index)
                }
            }
            
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
