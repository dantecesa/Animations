//
//  PivotRectangle.swift
//  Animations
//
//  Created by Dante Cesa on 1/17/22.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    var angle: Double
    var anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(angle), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(angle: -90, anchor: .topLeading), identity: CornerRotateModifier(angle: 0, anchor: .topLeading))
    }
}

struct PivotRectangle: View {
    @State private var isShowingRed = true
        
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }.onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct PivotRectangle_Previews: PreviewProvider {
    static var previews: some View {
        PivotRectangle()
    }
}
