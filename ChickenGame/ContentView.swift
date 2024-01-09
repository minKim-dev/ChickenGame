//
//  ContentView.swift
//  ChickenGame
//
//  Created by 김민성 on 2024/01/10.
//

import SwiftUI

struct GameView: View {
    @State private var systemChoice: String = "chicken_placeholder"
    @State private var userChoice: String = ""

    var body: some View {
        VStack {
            Text("Chicken Game")
                .font(<#Font?#>)
            Image(systemChoice)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding()

            Button(action: {
                // Handle choice 1
                self.userChoice = "Choice 1"
                // Add logic to compare choices and determine the winner
            }) {
                Text("Choice 1")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                // Handle choice 2
                self.userChoice = "Choice 2"
                // Add logic to compare choices and determine the winner
            }) {
                Text("Choice 2")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct ResultView: View {
    var systemChoice: String
    var userChoice: String
    var winner: String

    var body: some View {
        VStack {
            Text("System: \(systemChoice)")
            Text("User: \(userChoice)")
            Text("Winner: \(winner)")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
