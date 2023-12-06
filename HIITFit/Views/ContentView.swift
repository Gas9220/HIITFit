//
//  ContentView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9

    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab)
                .tag(9)

            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(selectedTab: $selectedTab, index: index)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .environmentObject(HistoryStore())
        .onAppear {
            print(URL.documentsDirectory)
        }
    }
}

#Preview {
    ContentView()
}
