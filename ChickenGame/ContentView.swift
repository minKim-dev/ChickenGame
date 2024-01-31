//
//  ContentView.swift
//  ChickenGame
//
//  Created by 김민성 on 2024/01/10.
//
// choice_1은 끝까지 직진하는 선택
// choice_2는 피하는 선택

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

                Text("The name chicken has its origins in a game in which two drivers drive toward each other on a collision course: one must swerve, or both may die in the crash, but if one driver swerves and the other does not, the one who swerved will be called a chicken, meaning a coward;").padding(10)

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
                            .onTapGesture {
                                self.userChoice = "Choice_1" // navigationLink를 탭하면 userChoice가 변경됨.
                                self.updateSystemChoice()
                                // Add logic to set systemChoice and winner based on the choice
                            }
                    }

                    NavigationLink(destination: ResultView(userChoice: $userChoice, systemChoice: $systemChoice, winner: $winner)) {
                        Text("Choice_2")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .onTapGesture {
                                self.userChoice = "Choice_2"
                                self.updateSystemChoice()
                            }
                    }
                    
                    
                }
            }
        }
    }
    
    private func updateSystemChoice() {
            // Generate a random index to represent system choice
            let randomIndex = Int.random(in: 0..<2)

            // Set systemChoice based on the random index
            systemChoice = (randomIndex == 0) ? "Choice_1" : "Choice_2"

            // Add logic to determine the winner based on userChoice and systemChoice
            determineWinner()
        }

        private func determineWinner() {
            // Add your logic to determine the winner based on userChoice and systemChoice
            // Set the winner variable accordingly
            // systemChoice랑 userChoice 같을 경우 -> 승자가 나오지 않음.
            // systemChoice랑 userChoice 다를 경우 ->
            // systemChoice == "Choice_1", userChoice == "Choice_2" -> winner is system
            // systemChoice == "Choice_2", userChoice == "Choice_1" -> winner is user
            
             if systemChoice == userChoice {
                winner = "there's no winner"
             
             } else { // systemChoice != userChoice
                if userChoice == "Choice_2" {
                    winner = "system"
                } else {
                    winner = "user"
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

