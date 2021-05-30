//
//  ShowHideAnimation.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 30/05/21.
//

import SwiftUI

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
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
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
