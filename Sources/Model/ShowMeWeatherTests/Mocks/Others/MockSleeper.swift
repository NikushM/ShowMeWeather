//
//  MockSleeper.swift
//  ShowMeWeather
//
//  Created by Nikush on 05.03.2025.
//

import Foundation

class MockSleeper : Sleeping {
    var LastSleep: Duration?
    func sleep(for duration: Duration) async throws {
        LastSleep = duration
    }
}
