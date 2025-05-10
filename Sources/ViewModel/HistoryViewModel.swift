//
//  HistoryViewModel.swift
//  ShowMeWeather
//
//  Created by Nikush on 11.03.2025.
//

import Foundation

class HistoryViewModel: HistoryViewModeling, ObservableObject {
    var rows:[String] = ["London", "Kyiv", "Lviv"]
    let service: any ForecastFetching
    
    
    init(
        service: any ForecastFetching = ForecastService()
    ) {
        self.service = service
        self.start()
    }
    
    func start() {
        objectWillChange.send()
        rows.append("Date : \(Date())")
    }
}
    
    protocol HistoryViewModeling {
        var rows:[String] { get }
    }

