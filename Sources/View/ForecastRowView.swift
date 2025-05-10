//
//  ForecastRowView.swift
//  ShowMeWeather
//
//  Created by Nikush on 04.03.2025.
//

import SwiftUI

struct ForecastRowView: View {
    let ViewState: WeatherViewModel.ForecastRow
    var body: some View {
        HStack {
            Text(ViewState.timeLabel)
            Spacer()
            Text (ViewState.tempLabel)
                .font(.title)
        }
    }
}

#Preview {
    List {
        ForecastRowView(ViewState: .init(timeLabel: "12.30", tempLabel: "20 C"));
        ForecastRowView(ViewState: .init(timeLabel: "12.30", tempLabel: "20 C"));
        ForecastRowView(ViewState: .init(timeLabel: "12.30", tempLabel: "20 C"));
        ForecastRowView(ViewState: .init(timeLabel: "12.30", tempLabel: "20 C"));
        ForecastRowView(ViewState: .init(timeLabel: "12.30", tempLabel: "20 C"));
        
    }
}
