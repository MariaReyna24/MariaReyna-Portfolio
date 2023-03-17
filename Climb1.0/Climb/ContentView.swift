//
//  ContentView.swift
//  Climb
//
//  Created by Maria Reyna  on 2/1/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @StateObject var game = Math()
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 15) {
                    // this is the score
                    Text("Score: \(game.score)")
                        .font(.largeTitle)
                    Spacer()
                    buttonsForAnswers(startIndex: 0, endIndex: 1)
                    buttonsForAnswers(startIndex: 1, endIndex: 3)
                    buttonsForAnswers(startIndex: 3, endIndex: 6)
                    buttonsForAnswers(startIndex: 6, endIndex: 10)
                    // this is the equation being displayed on screen
                    Text("\(game.firstNum) + \(game.secondNum)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    // this displays the generated answers on appear.
                }.onAppear {
                    game.generateAnswers()
                }
                // this is for the timer of the app
                // Adds an action to perform when this view detects data emitted by the given publisher.
                .onReceive(timer) { time in
                    // lets the counter count down so it dosent go past 0 into negative numbers
                    if game.timeRemaining > 0 {
                        game.timeRemaining -= 1
                    }
                }
                // the display for the top part of the app
                .navigationTitle("Level \(game.levelnum)")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Pause") {
//                            game.isPaused = true
//                            timer.upstream.connect().cancel()
                        }.font(.title2)
                        .foregroundColor(.red)
                        .disabled(true)
                        .opacity(0.5)
                    }
                    // timer in the right hand corner
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("\(game.timeRemaining)s")
                            .font(.system(size: 30))
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                    }
                }
                .background((Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: 393, height: 918)
                ))
                // shows end game menu when time runs out
                if game.timeRemaining == 0 {
                    EndGameMenu(game: game)
                }
                // code for a possible pause menu
                if game.isPaused == true {
                    Pausemenu(isPaused: $game.isPaused)
                }
                // Shows level completed screen when all squares are greeen
                if game.greenButtonCount == 10 {
                    LevelCompleted(game: game)
                }
            }
        } .navigationBarBackButtonHidden(true)
    }
    // layout for buttons
    func buttonsForAnswers(startIndex: Int, endIndex: Int) -> some View {
        HStack {
            ForEach(startIndex..<endIndex, id: \.self) { index in
                if index < game.choicearry.count {
                    Buttonview(num: game.choicearry[index], game: game)
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
