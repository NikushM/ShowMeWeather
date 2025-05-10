
import SwiftUI

struct ContentView<ViewModel: WeatherViewModeling>: View {
//    @State var query: String = ""
    @ObservedObject var viewModel : ViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("enter location", text: $viewModel.query)
                    NavigationLink(value: "history") {
                        Text ("History")
                    }
                    //                    NavigationLink{
                    //                        HistoryView(viewModel: HistoryViewModel())
                    //                    }label: {
                    //                        Text ("History")
                    //                    }
                }
                Divider()
                if let forecast = viewModel.forecastResult {
                    List(forecast) { forecast in
                        NavigationLink(value: forecast) {
                            ForecastRowView(ViewState: forecast)
                        }}
                        } else {
                            Spacer()
                            Image(systemName: "globe")
                                .imageScale(.large)
                                .foregroundColor(.blue)
                            Text("Please enter location")
                            Spacer()
                        }
                    }
                    .padding()
//                    .onChange(of: query) { oldValue, newValue in
//                        viewModel.queryDidChange(from: oldValue, to: newValue)
//                    }
                    .navigationDestination(
                        for: String.self) { key in
                            HistoryView(viewModel: HistoryViewModel())
                        }
                        .navigationDestination(for: WeatherViewModel.ForecastRow.self) { forecastItem in
                            Text(forecastItem.tempLabel)
                        }
                }
            }
        }
    
#Preview {
    ContentView(viewModel: WeatherViewModel())
}
