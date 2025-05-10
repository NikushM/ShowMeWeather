import Foundation

protocol WeatherViewModeling: ObservableObject {
    var forecastResult: [WeatherViewModel.ForecastRow]? { get }
    var query: String { get set }
}

class WeatherViewModel: WeatherViewModeling {
    @Published var forecastResult: [ForecastRow]?

    let service: ForecastFetching
    let sleeper: Sleeping

    init(
        service: ForecastFetching = ForecastService(),
        sleeper: Sleeping = Sleeper()
    ) {
        self.service = service
        self.sleeper = sleeper
        queryDidChange(from: "", to: query, shouldWait: false)
    }

    @DefaultWrapper(key: "last_query") var query: String = "" {
        didSet {
            queryDidChange(from: oldValue, to: query)
        }
    }

    struct ForecastRow: Identifiable, Hashable {
        let id: UUID = UUID()
        let timeLabel: String
        let tempLabel: String
    }

    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

    var measFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .short
        formatter.unitOptions = .providedUnit
        return formatter
    }()

    var pendingTask: Task<Void, Never>?

    func queryDidChange(from oldValue: String, to newValue: String, shouldWait: Bool = true) {
        guard oldValue != newValue else { return }

        pendingTask?.cancel()

        pendingTask = Task { [weak self] in
            guard let self = self else { return }

            do {
                if shouldWait {
                    try await self.sleeper.sleep(for: .seconds(3))
                }

                let result = try await self.service.getForecast(for: newValue)

                let rows = result.list.map { item in
                    ForecastRow(
                        timeLabel: self.dateFormatter.string(from: Date(timeIntervalSince1970: item.dt)),
                        tempLabel: self.measFormatter.string(from: Measurement<UnitTemperature>(
                            value: item.main.temp,
                            unit: .celsius
                        ))
                    )
                }

                await MainActor.run {
                    self.forecastResult = rows
                }

            } catch {
                print("Error: \(error)")
            }

            self.pendingTask = nil
        }
    }
}
