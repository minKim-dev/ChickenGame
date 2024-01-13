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
    @State private var button1IsOn: Bool = false
    @State private var button2IsOn: Bool = false
    

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
                
                Button(action: {
                    // Handle choice 1
                    self.userChoice = "Choice 1"
                    // Add logic to compare choices and determine the winner
                    // 버튼 입력하면 Choice1을 저장해 놓을 때가 필요함. 그것을 다른 뷰에서 사용해야 하니 Environment로 state 변수 만들어야 할 듯.
                    //네비게이션 링크
                    NavigationLink("Go to the result view", destination: ResultView(systemChoice: <#String#>, userChoice: self.userChoice, winner: <#String#>))
                    // systemChoice와 winner는 closure로 만들어야 함.
                    // roughly closure
                    // systemChoice: { }
                    
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
                    //네비게이션 링크
                    NavigationLink("Go to the result view", destination: ResultView(systemChoice: <#String#>, userChoice: self.userChoice, winner: <#String#>))
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
}

struct ResultView: View {
    var systemChoice: String = {
        if Int.random(in: 0...3) == 1 {
            systemChoice = "Choice 1"
        } else {
            systemChoice = "Choice 2"
        }
    }()
    var userChoice: String
    var winner: String

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
