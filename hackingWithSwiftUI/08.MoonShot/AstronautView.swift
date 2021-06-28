//
//  AstronautView.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 28/06/21.
//

import SwiftUI

struct AstronautView: View {
    
    // MARK:- Properties
    
    let astronaut: Astronaut
    
    // MARK:- Views
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

// MARK:- PreViews

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[1])
    }
}
