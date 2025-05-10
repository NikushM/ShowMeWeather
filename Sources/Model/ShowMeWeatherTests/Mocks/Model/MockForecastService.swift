import Foundation

class MockForecastService: ForecastFetching {
    var locationCalled: String? = nil
    var fakeResult: ForecastResponse?
    var fakeError: Error?

    func getForecast(for location: String) async throws -> ForecastResponse {
        locationCalled = location

        if let error = fakeError {
            throw error
        }

        if let result = fakeResult {
            return result
        }

        throw NSError(domain: "MockForecastService", code: 0, userInfo: [NSLocalizedDescriptionKey: "No result or error set"])
    }
}
