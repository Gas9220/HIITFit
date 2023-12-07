//
//  HeaderView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 06/12/23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var selectedTab: Int

    let titleText: String

    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundStyle(.white)

            HStack {
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    let isActive = index == selectedTab

                    ZStack {
                        Circle()
                            .frame(width: 15, height: 15)

                        Circle()
                            .frame(width: 30, height: 30)
                            .opacity(isActive ? 0.5 : 0)
                    }
                    .foregroundStyle(.white)
                    .onTapGesture {
                      selectedTab = index
                    }
                }
            }
            .font(.title2)
        }
    }
}

#Preview {
    HeaderView(selectedTab: .constant(0), titleText: "Squat")
        .background(Color.gray)
        .previewLayout(.sizeThatFits)
}
