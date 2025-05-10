import Foundation
struct ForecastResponse: Codable {
    struct Main: Codable {
        var temp: Double
    }
    
    struct Forecast: Codable {
        let main: Main
        let dt: TimeInterval
    }
    let list: ([Forecast])
}
