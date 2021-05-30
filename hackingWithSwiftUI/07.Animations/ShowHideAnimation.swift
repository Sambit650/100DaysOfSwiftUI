//
//  ShowHideAnimation.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 30/05/21.
//

import SwiftUI

// MARK:- Custom transitions

struct CornerRotationModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotationModifier(amount: -90, anchor: .topTrailing),
                  identity: CornerRotationModifier(amount: 0, anchor: .topTrailing))
    }
}

struct ShowHideAnimation: View {
    
    // MARK :- Properties
    
    @State private var isHidden: Bool = true
    
    // MARK:- Views
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    self.isHidden.toggle()
                }
            }
            
            if isHidden {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200, alignment: .center)
                    .transition(.pivot)
            }
        }
    }
}

// MARK:- Previews

struct ShowHideAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ShowHideAnimation()
    }
}
