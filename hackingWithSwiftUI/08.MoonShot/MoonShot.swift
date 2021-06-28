//
//  MoonShot.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 10/06/21.
//

import SwiftUI

struct MoonShot: View {
    
    // MAKR:- Properties
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // MARK:- Views
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List(missions) { mission in
                    
                    NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                        
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 44, height: 44)
                        
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                            Text(mission.formattedLaunchDate)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

// MARK :- PreViews

struct MoonShot_Previews: PreviewProvider {
    static var previews: some View {
        MoonShot()
    }
}
