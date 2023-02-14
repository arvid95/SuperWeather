//
//  ChangeLocationView.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2023-02-14.
//

import SwiftUI
import CoreLocation

struct ChangeLocationView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @State private var input: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search City", text: $input)
                    .padding(.leading, 20)
                    .onSubmit {
                        viewModel.selectedCity = input
                        viewModel.getCityByLocation()
                    }
            }
            .foregroundColor(.white)
            .padding(15)
            .background(ZStack(alignment: .leading) {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 10)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue.opacity(0.5))
            })
            
            SearchListView()
            
            List {
                ForEach(viewModel.cityResultList.results, id: \.self) { city in
                    HStack {
                        Text(city.name)
                        Text(city.countryCode)
                        Text(city.country)
                    }
                    .onTapGesture {
                        viewModel.addCityToList(input: city)
                        /*input = ""
                        viewModel.clearLocationResultList()*/
                    }
                }
            }
        }
        .navigationTitle("Favorite Cities")
    }}


struct ChangeLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLocationView()
    }
}
