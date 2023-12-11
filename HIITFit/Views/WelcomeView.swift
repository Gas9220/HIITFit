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
    @State private var showReports = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(
                    selectedTab: $selectedTab,
                    titleText: "Welcome")
                
                Spacer()

                ContainerView {
                    ViewThatFits {
                        VStack {
                            WelcomeView.images
                            WelcomeView.welcomeText
                            getStartedButton

                            Spacer()

                            HStack(spacing: 15) {
                                historyButton
                                reportsButton
                            }
                        }
                        VStack {
                            WelcomeView.welcomeText
                            getStartedButton

                            Spacer()

                            HStack(spacing: 15) {
                                historyButton
                                reportsButton
                            }
                        }
                    }
                }
                .frame(height: geometry.size.height * 0.8)
            }
            .sheet(isPresented: $showHistory) {
                HistoryView(showHistory: $showHistory)
            }
            .sheet(isPresented: $showReports) {
                ReportsView()
            }
        }
    }

    var getStartedButton: some View {
        RaisedButton(buttonText: "Get Started") {
            selectedTab = 0
        }
        .padding()
    }

    var historyButton: some View {
        Button {
            showHistory = true
        } label: {
            Text("History")
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }

    var reportsButton: some View {
        Button {
            showReports = true
        } label: {
            Text("Reports")
                .fontWeight(.bold)
                .padding([.leading, .trailing], 5)
        }
        .padding(.bottom, 10)
        .buttonStyle(EmbossedButtonStyle())
    }
}

#Preview {
    WelcomeView(selectedTab: .constant(9))
}
