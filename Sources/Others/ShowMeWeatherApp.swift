//
//  ShowMeWeatherApp.swift
//  ShowMeWeather
//
//  Created by Nikush on 25.02.2025.
//

import SwiftUI

@main
struct ShowMeWeatherApp: App {
    var body: some Scene {
        WindowGroup {
                ContentView(viewModel: WeatherViewModel())
            }
        }
    }
