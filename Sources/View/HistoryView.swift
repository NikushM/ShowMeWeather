//
//  HistoryView.swift
//  ShowMeWeather
//
//  Created by Nikush on 11.03.2025.
//

import SwiftUI

struct HistoryView<Viewmodel: HistoryViewModeling & ObservableObject>: View {
    @ObservedObject var viewModel: Viewmodel
    
    var body: some View {
        List (viewModel.rows, id: \.self) {
            Text($0)
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HistoryView(viewModel: HistoryViewModel())
}
