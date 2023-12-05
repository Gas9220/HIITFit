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

            ForEach(0..<4) { number in
                ExerciseView(index: number)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
