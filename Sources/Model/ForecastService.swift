import Foundation

protocol ForecastFetching {
    func getForecast(for location: String) async throws -> ForecastResponse
}

class ForecastService: ForecastFetching {

    struct ForecastServiceError: Error {
        let reason: String
    }

    func getForecast(for location: String) async throws -> ForecastResponse {
        let requestPath = "https://api.openweathermap.org/data/2.5/forecast?q=\(location)&units=metric&appid=\(APIKeys.openWeather)"
        
        guard let url = URL(string: requestPath) else {
            throw ForecastServiceError(reason: "Can't make URL from \(requestPath)")
        }

        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)

        let forecast = try JSONDecoder().decode(ForecastResponse.self, from: data)
        return forecast
    }
}
