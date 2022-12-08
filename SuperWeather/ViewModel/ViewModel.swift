//
//  ViewModel.swift
//  SuperWeather
//
//  Created by Arvid Axelsson on 2022-12-08.
//

import Foundation

class ViewModel: ObservableObject {
    
    private var calendar = Calendar.current
    @Published var today = Date()
    //@Published var tomorrow: Date
    
    init() {
        let midnight = calendar.startOfDay(for: Date())
        //tomorrow = getTomorrowDate()
        
    }
    
    func getTomorrowDate() -> Date {
        return calendar.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    }
    
}
