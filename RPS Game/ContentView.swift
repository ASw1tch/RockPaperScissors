//
//  ContentView.swift
//  RPS Game
//
//  Created by Anatoliy Petrov on 16.1.23..
//

import SwiftUI

struct mainTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        
            .font(.largeTitle.bold())
            .foregroundColor(.init(Color(red: 221/255, green: 221/255, blue: 221/255)))
            .padding(1)
    }
}


extension View {
    func mainTextStyleAplly() -> some View {
        modifier(mainTextStyle())
    }
}


struct ContentView: View {
    @State private var showScore = false
    @State private var scoreCount = 0
    @State private var scoreTitle = ""
    
    @State private var gameIsOn = false
    
    @State private var gameOptions = ["rock", "paper", "scissors"]
    @State private var turnOptions = ["rock", "paper", "scissors"]
    @State private var computerTurn = Int.random(in: 0...2)
    @State private var shouldTransition = false
    
    
    
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 48/255, green: 71/255, blue: 94/255), location: 0.3),
                .init(color: Color(red: 34/255, green: 40/255, blue: 49/255), location: 0.3),
                .init(color: Color(red: 240/255, green: 84/255, blue: 84/255), location: 1)
                
            ], center: .bottom, startRadius: 200, endRadius: 600)
                .ignoresSafeArea()
            VStack {
                Text("Rock, Paper, Scissors").mainTextStyleAplly()
                Text("One, Two, Three").mainTextStyleAplly()
                
                Text("Your score is: \(scoreCount)")
                    .frame(width: 300, height: 40, alignment: .leading)
                    .font(.headline.weight(.heavy))
                    .foregroundColor(.green)
                    .padding(20)
                
                
                
                Image(gameOptions[computerTurn]) //Надо обновляться тут
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 200, height: 200)
                
                
                
                Spacer()
                Spacer()
                Spacer()
                
            }
            
            VStack {
                Spacer()
                
                Text("Choose your fighter")
                    .mainTextStyleAplly()
                    .padding(35)
                
                HStack {
                    ForEach(0..<3) {number in
                        Button  {
                            figureTapped(number)
                            
                            
                        }label: {
                            Image(turnOptions[number])
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 90, height: 90, alignment: .topLeading)
                                .padding()
                        }
                        
                    }
                }
                
            }
            
        }
        
    }
    
    func computerMove() {
        
    }
    
    func figureTapped(_ number: Int) {
        switch number {
        case 0:
            computerTurn = Int.random(in: 0...2)
            switch gameOptions[computerTurn] {
            case "rock":
                print("Draw")
            case "paper":
                print("Loser!")
                scoreCount -= 1
            case "scissors":
                print("Wow!")
                scoreCount += 1
            default:
                print("=")
            }
            
        case 1:
            computerTurn = Int.random(in: 0...2)
            switch gameOptions[computerTurn] {
            case "paper":
                print("Draw")
            case "scissors":
                print("Loser!")
                scoreCount -= 1
            case "rock":
                print("Wow!")
                scoreCount += 1
            default:
                print("=")
            }
        case 2:
            computerTurn = Int.random(in: 0...2)
            switch gameOptions[computerTurn] {
            case "scissors":
                print("Draw")
            case "rock":
                print("Loser!")
                scoreCount -= 1
            case "paper":
                print("Wow!")
                scoreCount += 1
            default:
                print("=")
            }
        default:
            print("=")
        }
        
    }
    
    
    func turnResults() {
        
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
