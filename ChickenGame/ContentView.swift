//
//  ContentView.swift
//  ChickenGame
//
//  Created by 김민성 on 2024/01/10.
//

import SwiftUI

struct GameView: View {
    @State private var systemChoice: String = "chicken_placeholder"
    @State private var userChoice: String = "Empty"
    @State private var winner: String = "Anyone"

    var body: some View {
        
        NavigationView {
            VStack {
                Text("Chicken Game")
                    .font(.custom("AmericanTypewriter", fixedSize: 36))
                
                Text("The name chicken has its origins in a game in which two drivers drive toward each other on a collision course: one must swerve, or both may die in the crash, but if one driver swerves and the other does not, the one who swerved will be called a chicken, meaning a coward; ").padding(10)
                
                Image(systemChoice)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
                
                
                HStack {
                    NavigationLink(destination: ResultView(userChoice: $userChoice, systemChoice: $systemChoice, winner: $winner)) {
                        Text("Choice_1")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: ResultView(userChoice: $userChoice, systemChoice: $systemChoice, winner: $winner)) {
                        Text("Choice_2")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

struct ResultView: View {
    @Binding var userChoice: String
    @Binding var systemChoice: String
    @Binding var winner: String

    var body: some View {
        VStack {
            Text("System: \(systemChoice)")
                .padding()
            Text("User: \(userChoice)")
                .padding()
            Text("Winner: \(winner)")
                .padding()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
