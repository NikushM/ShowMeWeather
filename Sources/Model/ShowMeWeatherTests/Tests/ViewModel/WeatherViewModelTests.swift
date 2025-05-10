//
//  WeatherViewModelTests.swift
//  ShowMeWeatherTests
//
//  Created by Nikush on 05.03.2025.
//

import XCTest

@testable import ShowMeWeather


final class WeatherViewModelTests: XCTestCase {
    
    var subjectUnderTest : WeatherViewModel!
    
    override func setUpWithError() throws {
    }
    
    
    override func tearDownWithError() throws {
    }
    
    func test_ForecastRequestedFromService_whenQueryChanged() async throws {
        //Ready
        let mockService = MockForecastService()
        let viewModel = WeatherViewModel(
            service: mockService as! ForecastFetching,
            sleeper: MockSleeper() as! Sleeping)
        mockService.fakeResult = ForecastResponse(list: [])
        
        //Triger
       viewModel.queryDidChange(from: "", to: "TestLocation")
        try await Task.sleep(nanoseconds: 1)
        
        //Check
        XCTAssertEqual(mockService.locationCalled, "TestLocation")
    }
    func test_sleepFor3Seconds_whenQueryChanged() async throws {
       // ...
       }
    
    func test_forecastUpdated_whenServiceResponded() async throws {
        //Ready
        let mockService = MockForecastService()
        let viewModel = WeatherViewModel(service: mockService as! ForecastFetching)
        mockService.fakeResult = ForecastResponse(list: [
            .init(main: .init(temp: 42), dt: 0)]
        )
        
        //Triger
        viewModel.queryDidChange(from: "", to: "TestLocation")
        try await Task.sleep(for: .seconds(1))

        //Check
        XCTAssertEqual(viewModel.forecastResult?.count, 1)
        XCTAssertEqual(viewModel.forecastResult?.first?.tempLabel, "42")
        XCTAssertEqual(viewModel.forecastResult?.first?.timeLabel, "01/01/1970, 01:00")
    }
    }

