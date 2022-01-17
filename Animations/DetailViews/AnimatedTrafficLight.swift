//
//  ChameleonButtons.swift
//  Animations
//
//  Created by Dante Cesa on 1/14/22.
//

import SwiftUI

struct AnimatedTrafficLight: View {
    private let possibleColors: [Color] = [.red, .orange, .green]
    @State private var opacity: [Double] = [0, 0, 0]
    @State private var angle: Double = 0
    @State private var angleforButton: [Double] = [0, 0, 0]
    @State private var buttonText: [String] = ["1", "2", "3"]
    
    var body: some View {
        VStack{
            ForEach(0..<possibleColors.count) { index in
                Button("\(index + 1)") {
                    withAnimation (.easeInOut(duration: 2)) {
                        angleforButton[index] += 360
                    }
                    if index + 1 < possibleColors.count {
                        opacity[index + 1] += 1
                    }
                }
                    .padding(50)
                    .background(possibleColors[index])
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(.degrees(angleforButton[index]), axis: (x: 1, y: 1, z: 1) )
                    .opacity(opacity[index])
                    .animation(.default.delay(0.5), value: opacity[index])
            }.onAppear {
                opacity[0] = 1
            }
        }
    }
}

struct ChameleonButtons_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedTrafficLight()
    }
}
