//
//  GuessTheFlag.swift
//  hackingWithSwiftUI
//
//  Created by Sambit Das on 16/05/21.
//

import SwiftUI

struct GuessTheFlag: View {
    
    // MARK:- Properties
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var scoreTitle = ""
    @State private var showingScore: Bool = false
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var yourScore: Int = 0
    @State private var totalQuestionAttempted = 0
    
    var body: some View {
        
        // MARK:- views
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .white, .gray]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.title)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                Text("Your Score is \(yourScore)")
                    .foregroundColor(.black)
                    .font(.title)
                    .fontWeight(.medium)
                
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle),
                  message: Text("Your score is \(yourScore)/\(totalQuestionAttempted)"),
                  dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    // MARK:- Methods
    
    private func flagTapped(_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = "Wow! Correct"
            yourScore += 1
        } else {
            scoreTitle = "Wrong! That's flag of \(countries[correctAnswer])"
        }
        showingScore = true
        totalQuestionAttempted += 1
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag()
    }
}
