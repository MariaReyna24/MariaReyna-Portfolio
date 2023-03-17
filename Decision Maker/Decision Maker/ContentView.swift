//
//  ContentView.swift
//  Decision Maker
//
//  Created by Maria Reyna on 12/8/22.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.gray, .red, .orange, .yellow,
                              .green, .blue, .purple, .pink]
    @State private var showingAlert = false
    @State private var fgColor: Color = .gray
    @State var listofoptions = [option(opt:"")]
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    List{
                        ForEach(listofoptions.indices, id:\.self){index in
                            TextField("Enter option", text: $listofoptions[index].opt) //storing user input into array
                        }.onDelete { indexSet in
                            listofoptions.remove(atOffsets: indexSet)  //allowing for swipe to delete
                        }
                    }
                    .scrollContentBackground(.hidden)
                   

                    //This button allows you to pick a random element in the array
                    Button("Pick option"){
                        showingAlert = true
                    }
                    
                    .disabled(listofoptions[0].opt.isEmpty) //disables button if text is empty
                    .opacity(listofoptions[0].opt.isEmpty ? 0.5 : 1.0) //makes the opacity lower if button disabled
                    .frame(maxWidth: 150, maxHeight: 50)
                    .background(Color.black.cornerRadius(60))
                    .font(.headline)
                    .foregroundColor(.white)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Your Choice is: \(listofoptions.randomElement()?.opt ?? "Nothing")")) //chooses random element from array if nothing there returning 'nothing'
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom) // puts button at bottom of screen

                }
                .background(Color("background"))
                .navigationTitle("Enter Your Choices")
                
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Add more"){
                            listofoptions.append(option(opt: ""))
                        }
                        .disabled(listofoptions.count > 5 )
                        .opacity(listofoptions.count > 5 ? 0.2 : 1.0)
                        .foregroundColor(.black)
                        .font(.headline)
                    }
                }
            }
        }
    }

    struct option: Identifiable {
        var id = UUID()
        var opt : String

    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
