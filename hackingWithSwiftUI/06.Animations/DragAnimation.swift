//
//  DragAnimation.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 26/05/21.
//

import SwiftUI

struct DragAnimation: View {
    
    // MARK:- Properties
    
    let letters = Array("Hello SwiftUI")
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    
    // MARK:- Views
    
    var body: some View {
        
        VStack {
            //DragGesture
            LinearGradient(gradient: Gradient(colors: [.yellow, .red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { self.dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                self.dragAmount = .zero
                            }
                        }
                )
            
            //Letter Drag
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(self.letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(self.enabled ? Color.blue : Color.red)
                        .offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }
//            .gesture(
//                DragGesture()
//                    .onChanged { self.dragAmount = $0.translation }
//                    .onEnded { _ in
//                        self.dragAmount = .zero
//                        self.enabled.toggle()
//                    }
//            )
        }
    }
}

// MARK:- Previews

struct DragAnimation_Previews: PreviewProvider {
    static var previews: some View {
        DragAnimation()
    }
}
