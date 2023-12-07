//
//  ContainerView.swift
//  HIITFit
//
//  Created by Gaspare Monte on 07/12/23.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Color("background"))
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 25)
                    .foregroundStyle(Color("background"))
            }
            content
        }
    }
}

#Preview {
    ContainerView {
        VStack {
            RaisedButton(buttonText: "Hello World", action: {})
                .padding(50)
            Button("Tap me!") {}
                .buttonStyle(EmbossedButtonStyle(buttonShape: .round))
        }
    }
    .padding(50)
    .previewLayout(.sizeThatFits)
}
