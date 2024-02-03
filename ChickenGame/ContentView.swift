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
    private let choice1 = "Choice_1" // 이렇게 상수를 만들면 나중에 버튼 이름을 변경할 때 한 곳에서 변경하면 되서 훨씬 효율적임.
    private let choice2 = "Choice_2"
    private let numberOfChoices = 2
    
    @State private var systemChoice: String = "chicken_placeholder"
    @State private var userChoice: String = "Empty"
    @State private var winner: String = "Anyone"
    @State private var isActive: Bool = false

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
                    // NavigationLink의 destination 중복 문제로 인한 문제 수정해야함.
                    NavigationLink(destination: ResultView(winner: $winner, userChoice: $userChoice, systemChoice: $systemChoice), isActive: $isActive) {
                        Text("\(choice1)")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .onTapGesture {
                                self.userChoice = choice1 // navigationLink를 탭하면 userChoice가 변경됨.
                                self.updateSystemChoice()
                                self.isActive = true
                            }
                    }

                    NavigationLink(destination: ResultView(winner: $winner, userChoice: $userChoice, systemChoice: $systemChoice), isActive: $isActive) {
                        Text("\(choice2)")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .onTapGesture {
                                self.userChoice = choice2
                                self.updateSystemChoice()
                                self.isActive = true
                            }
                    }
                    
                    
                }
            }
        }
    }
    
    
    private func updateSystemChoice() {
            // Generate a random index to represent system choice
            // Avoide Magic Numbers: Instead of hardcoding Int.random(in: 0..<2) with 2,
            //use a constant to make the code more readable and maintainable.
            let randomIndex = Int.random(in: 0..<numberOfChoices)

            // Setting systemChoice based on the random index
            systemChoice = (randomIndex == 0) ? "Choice_1" : "Choice_2"

            // Logic to determine the winner based on userChoice and systemChoice
            determineWinner()
    }

    private func determineWinner() {
            // Logic to determine the winner based on userChoice and systemChoice
            // Setting the winner variable accordingly
            // systemChoice랑 userChoice 같을 경우 -> 승자가 나오지 않음.
            // systemChoice랑 userChoice 다를 경우 ->
            // systemChoice == "Choice_1", userChoice == "Choice_2" -> winner is system
            // systemChoice == "Choice_2", userChoice == "Choice_1" -> winner is user
            
            // Consider using a switch statement for winner determination.
            // It can make the code more readable and scalable
            // if you decide to add more choices in the future.
        
        switch(systemChoice, userChoice) {
        case (choice1, choice2):
            winner = "system"
            
        case (choice2, choice1):
            winner = "user"
            
        default:
            winner = "there's no winner."
        }
    }
}

struct ResultView: View {
    @Binding var winner: String
    @Binding var userChoice: String
    @Binding var systemChoice: String
    
   

    // return to home and reset the data
    var body: some View {
        NavigationView {
            VStack {
                Text("userChoice: \(userChoice)")
                    .padding()
                
                Text("systemChoice: \(systemChoice)")
                    .padding()
                
                Text("Winner: \(winner)")
                    .padding()
                
                NavigationLink(destination: GameView()) {
                    Text("Return to home")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.reset()
                        }
                }
            }
            
            
        }
        
    }
    
    private func reset() {
        winner = ""
        userChoice = ""
        systemChoice = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

