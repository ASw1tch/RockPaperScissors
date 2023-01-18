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
    @State private var chosedOption = Int.random(in: 0...2)
    
    @State private var gameOptions = ["rock", "paper", "scissors"]
    
    
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
            Spacer()
                
                Image(gameOptions[chosedOption])
                    .renderingMode(.original)
                Spacer()
                Spacer()
                Spacer()
                
            }
            
            VStack {
                Spacer()
                Text("Choose your fighter")
                    .mainTextStyleAplly()
                    .padding()
                
                HStack {
                    ForEach(0..<3) {number in
                        Button {
                            figureTapped(number)
                        }label: {
                            Image(gameOptions[number])
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
    func computedFigure() {
        gameOptions.shuffle()
        chosedOption = Int.random(in: 0...2)
    }
    
    func figureTapped(_ number: Int) {
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
