//
//  levelCompleted.swift
//  Climb
//
//  Created by Maria Reyna  on 2/20/23.
//

import SwiftUI

struct LevelCompleted: View {
    @ObservedObject var game: Math
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    Text("Level Completed!")
                        .foregroundColor(.green)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 250, height: 110)
                        .background(Rectangle().fill(Color.black).opacity(0.9))
                    Button("Continue") {
                        game.newLevel()
                    }
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 250, height: 50)
                    .background(.black)
                    .opacity(0.9)
                        NavigationLink(destination: MainMenuView(), label: {
                            Text("Main Menu")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 250, height: 50)
                            .background(.black)
                            .opacity(0.9)
                        }
                   ) }
                }
            }
        }
    struct LevelCompleted_Previews: PreviewProvider {
        static var previews: some View {
            LevelCompleted(game: Math())
        }
    }
}
