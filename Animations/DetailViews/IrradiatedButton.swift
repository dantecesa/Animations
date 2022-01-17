//
//  IrradiatedButton.swift
//  Animations
//
//  Created by Dante Cesa on 1/14/22.
//

import SwiftUI

struct IrradiatedButtons: View {
    @State private var radiatingOutwards: Bool = true
    @State private var animationOutwardsScaler: Double = 2.0
    @State private var animationInwardsScaler: Double = 2.0
    
    var body: some View {
            Button(action: {
                radiatingOutwards.toggle()
            }, label: {
                Text("Radiating outwards is: " + String(radiatingOutwards))
            })
                .padding(100)
                .foregroundColor(.white)
                .background(radiatingOutwards ? .green : .red)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(radiatingOutwards ? .green : .red)
                            .scaleEffect(radiatingOutwards ? 2 : 0)
                            .opacity(radiatingOutwards ? 0 : 1)
                            .animation(.easeIn(duration: 1), value: radiatingOutwards ? 0 : 2)
                )
    }
}

struct IrradiatedButton_Previews: PreviewProvider {
    static var previews: some View {
        IrradiatedButtons()
    }
}
