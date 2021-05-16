//
//  ViewsAndModifiers.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 17/05/21.
//

import SwiftUI

// MARK:- CapsuleView

struct CapsuleView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .clipShape(Capsule())
    }
}

// MARK:- custome Style View

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .foregroundColor(.black)
            .background(Color.white)
            .clipShape(Capsule())
    }
}

// Best way to use this style

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ViewsAndModifiers: View {
    
    // MARK:- Body
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                CapsuleView(text: "Welcome to SwiftUI")
                CapsuleView(text: "Sambit Das")
                CapsuleView(text: "iOS Developer")
                CapsuleView(text: "sambit650@gmail.com")
                CapsuleView(text: "Bangalore")
                
                Text("+8594949701")
                    .titleStyle()
                
                Spacer()
            }
        }
    }
}

// MARK:- PreView

struct ViewsAndModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAndModifiers()
    }
}
