//
//  AnimatedString.swift
//  Animations
//
//  Created by Dante Cesa on 1/15/22.
//

import SwiftUI

struct AnimatedString: View {
    let string = Array("Hello, again!")
    @State private var enabled: Bool = false
    @State private var dragAmount: CGSize = CGSize.zero
    
    var body: some View {
        VStack (spacing: 20) {
            HStack (spacing: 0) {
                ForEach(0..<string.count) { index in
                    Text(String(string[index])).font(Font.custom("IntroScriptDemo-Medium", size: 60))
                        .foregroundColor(.white)
                        //.gradientForeground(colors: enabled ? [.blue, .green] : [.red, .purple])
                        .colorMultiply(enabled ? .blue : .red)
                        .animation(.default.delay(0.25 * Double(index)), value: enabled)
                        .onTapGesture {
                            enabled.toggle()
                        }
                        .offset(dragAmount)
                        .gesture(
                            DragGesture()
                                .onChanged {
                                    dragAmount = $0.translation
                                }
                                .onEnded { _ in
                                    dragAmount = CGSize.zero
                                }
                        )
                        .animation(.default.delay(Double(index) / 20), value: dragAmount)
                }
            }
        }
    }
}

struct AnimatedString_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedString()
    }
}
