//
//  ContentView.swift
//  Animations
//
//  Created by Dante Cesa on 1/14/22.
//

import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack (spacing: 20) {
                Spacer()
                NavigationLink("Draggable Card!") { DraggableCard() }
                NavigationLink("Stoplight") { AnimatedTrafficLight() }
                NavigationLink("Chameleon Buttons") { ChameleonButtons() }
                NavigationLink("Irradiated Button") { IrradiatedButtons() }
                NavigationLink("Animated String") { AnimatedString() }
                Spacer()
                //NavigationLink("Old buttons") { OldButtons() }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
