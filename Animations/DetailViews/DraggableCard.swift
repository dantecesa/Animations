//
//  AnimatedCard.swift
//  Animations
//
//  Created by Dante Cesa on 1/14/22.
//

import SwiftUI

struct DraggableCard: View {
    @State private var dragAmount: CGSize = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onEnded { index in
                        dragAmount = CGSize.zero
                    }
                    .onChanged {
                        dragAmount = $0.translation
                    }
            )
            .animation(.default, value: dragAmount)
    }
}

struct AnimatedCard_Previews: PreviewProvider {
    static var previews: some View {
        DraggableCard()
    }
}
