import Foundation

enum APIKeys {
    static var openWeather: String {
        guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let value = plist["OPENWEATHER_KEY"] as? String else {
            fatalError("❌ OPENWEATHER_KEY not found in Config.plist")
        }
        return value
    }
}
