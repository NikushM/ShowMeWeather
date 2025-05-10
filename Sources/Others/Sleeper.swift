//
//  Sleeper.swift
//  ShowMeWeather
//
//  Created by Nikush on 05.03.2025.
//

import Foundation

protocol Sleeping{
    func sleep (for duration: Duration) async throws 
}

struct Sleeper : Sleeping {
    func sleep (for duration: Duration) async throws {
       try await Task.sleep (for: duration)
    }
}
