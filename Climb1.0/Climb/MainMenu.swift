//
//  MainMenu.swift
//  Climb
//
//  Created by Hadi Chamas  on 2/14/23.
//
import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 150)
                        .shadow(color: .black, radius: 10)
                    Spacer()
                    Button(action: {
                    }) {
                        Text("Continue")
                            .padding()
                            .background(Color("myColor"))
                            .foregroundColor(Color("textColor"))
                            .cornerRadius(10)
                    }
                    .disabled(true)
                    .opacity(0.7)
                    NavigationLink(destination: ContentView(), label: {
                        Text("New Game")
                            .padding()
                            .background(Color("myColor"))
                            .foregroundColor(Color("textColor"))
                            .cornerRadius(10)
                    }
                    )
                    NavigationLink(destination: LeaderBoardView(), label: {
                        Text("Leaderboard")
                            .padding()
                            .background(Color("myColor"))
                            .foregroundColor(Color("textColor"))
                            .cornerRadius(10)
                    }
                    )
                    Spacer()
                    Spacer()
                }
                .background(Image("mainMenuBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(width: 393, height: 918))
                    .background(Color("myColor"))
            }
        }.navigationBarBackButtonHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
