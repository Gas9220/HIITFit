//
//  WelcomeView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var selectedTab: Int

    @State private var showHistory = false

    var body: some View {
        ZStack {
            VStack {
                HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
                    .padding(.bottom)

                Spacer()

                Button("History") {
                    showHistory.toggle()
                }
                .padding(.bottom)
                .sheet(isPresented: $showHistory) {
                    HistoryView(showHistory: $showHistory)
                }
            }

            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }

                    Image("step-up")
                        .resizedToFill(width: 240, height: 240)
                }

                getStartedButton
            }
        }
    }

    var getStartedButton: some View {
        RaisedButton(buttonText: "Get Started") {
            selectedTab = 0
        }
        .padding()
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
