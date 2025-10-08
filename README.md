# ShowMeWeather ☀️🌧️

**ShowMeWeather** — це простий iOS-додаток, який показує прогноз погоди для вибраного міста.  
Зроблений на **Swift + SwiftUI**, використовує API [OpenWeatherMap](https://openweathermap.org/api).

## 🚀 Функціонал
- Пошук прогнозу погоди за містом
- Використання `async/await` для роботи з мережею
- JSON-декодування у модель `ForecastResponse`
- Простий інтерфейс на SwiftUI

## 🔑 Налаштування API ключа
У додатку використовується ключ OpenWeather. **З міркувань безпеки ключ не зберігається у репозиторії**.

1. Створи файл `Config.plist` у корені проєкту.
2. Додай у нього такий вміст:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>OPENWEATHER_KEY</key>
    <string>YOUR_API_KEY_HERE</string>
</dict>
</plist>
```

3. У Xcode переконайся, що `Config.plist` доданий у твій Target.
4. Додай `Config.plist` у `.gitignore`, щоб не пушити ключ у GitHub.

## 🛠 Використання API ключа у коді
У коді ключ завантажується так:

```swift
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
```
І в `ForecastService`:
```swift
let requestPath = "https://api.openweathermap.org/data/2.5/forecast?q=\(location)&units=metric&appid=\(APIKeys.openWeather)"
```

## 📌 Нотатка
Старий ключ, який був у коді, більше не використовується. Для запуску потрібно додати свій власний ключ у `Config.plist`.
