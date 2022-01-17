//
//  SwiftUIView.swift
//  Animations
//
//  Created by Dante Cesa on 1/14/22.
//

import SwiftUI

struct ChameleonButtons: View {
    private let possibleColors: [Color] = [.red, .orange, .yellow, .green, .blue, .indigo, .purple]
    @State private var colorIndex: Int = 0
    
    var body: some View {
        VStack (spacing: 50) {
            Circle()
                .foregroundColor(possibleColors[colorIndex])
                .frame(width: 200, height: 300, alignment: .center)
                .animation(.default, value: colorIndex)
            HStack {
                Spacer()
                Button("Previous color") { previousColor() }.buttonStyle(.bordered)
                Spacer()
                Button("Next color") { nextColor() }.buttonStyle(.bordered)
                Spacer()
            }
        }
    }
    
    func nextColor() {
        if colorIndex + 1 < possibleColors.count {
            colorIndex += 1
            return
        }
        colorIndex = 0
    }
    
    func previousColor() {
        if colorIndex - 1 > 0 {
            colorIndex -= 1
            return
        }
        colorIndex = 6
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChameleonButtons()
    }
}
