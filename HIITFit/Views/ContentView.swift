//
//  ContentView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 05/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()

            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(index: index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
