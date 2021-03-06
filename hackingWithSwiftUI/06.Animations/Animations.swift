//
//  Animations.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 23/05/21.
//

import SwiftUI

struct Animations: View {
    
    // MARK:- Properties
    
    @State private var animationAmount: CGFloat = 1
    @State private var animationCircle: CGFloat = 1
    @State private var enabled: Bool = false
    
    // MARK:- Views
    
    var body: some View {
        VStack {
            Button("Tap me") {
                self.animationAmount += 1
            }
            .padding(50)
            .background(Color.red)
            .foregroundColor(.blue)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .animation(.default)
            .blur(radius: (animationAmount - 1) * 3)
            
            Button("minus") {
                if animationAmount != 1 {
                    self.animationAmount -= 1
                }
                self.animationCircle = 2
            }
            .padding(20)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.primary)
                    .scaleEffect(animationCircle)
                    .opacity(Double(2 - animationCircle))
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false)
                    )
            )
            
            Button("Tap me") {
                self.enabled.toggle()
            }
            .frame(width: 200, height: 200, alignment: .center)
            .foregroundColor(.white)
            .background(enabled ? Color.red : Color.blue)
            .animation(nil)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
            
        }
    }
}

// MARK:- Previews

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}
