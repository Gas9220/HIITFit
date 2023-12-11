//
//  ReportsView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 11/12/23.
//

import SwiftUI

struct ReportsView: View {
    @State private var enableBarChart = false

    var body: some View {
        VStack {
            Text("History for Last Week")
                .font(.largeTitle)

            BarChartWeekView(isBarChart: $enableBarChart)

            Toggle("Bar chart", isOn: $enableBarChart)
                .padding(.horizontal, 25)
        }
    }
}

#Preview {
    ReportsView()
        .environmentObject(HistoryStore(preview: true))
}
