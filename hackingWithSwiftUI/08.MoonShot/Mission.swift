//
//  Mission.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 28/06/21.
//

import SwiftUI

struct Mission: Codable, Identifiable {
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
}

struct CrewRole: Codable {
    let name: String
    let role: String
}
