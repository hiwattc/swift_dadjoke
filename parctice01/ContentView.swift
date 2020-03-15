//
//  ContentView.swift
//  parctice01
//
//  Created by hiwatt on 2020/03/15.
//  Copyright © 2020 hiwatt. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Joke.entity(), sortDescriptors: [NSSortDescriptor(keyPath:\Joke.setup,ascending:false)]) var jokes:FetchedResults<Joke>
    @State private var showingAddJoke = false

    var body: some View {
        ZStack(alignment: .top){
            LinearGradient(gradient: Gradient(colors:[Color("Start"),Color("Middle"),Color("End")]), startPoint: .top, endPoint: .bottom)
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                //ScrollView(.horizontal, showsIndicators: true){
                    HStack(spacing:10){
                        ForEach(jokes, id :\.setup){joke in
                            JokeCard(joke:joke)
                            
                        }
                        
                    }
                    
                }
                ScrollView(.horizontal, showsIndicators: false){
                //ScrollView(.horizontal, showsIndicators: true){
                    HStack(spacing:10){
                        ForEach(jokes, id :\.setup){joke in
                            JokeCard(joke:joke)
                            
                        }
                        
                    }
                    
                }

            }

            
            Button("Add Joke"){
                self.showingAddJoke.toggle()
            }
            .padding()
            .background(Color.black.opacity(0.5))
            .clipShape(Capsule())
            .foregroundColor(.white)
            .offset(y:50)
        }
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $showingAddJoke) {
                   AddView().environment(\.managedObjectContext,self.moc)
            }
    
        /*
        NavigationView{
            List{
                ForEach(jokes, id:\.setup) {joke in
                    NavigationLink(destination:Text(joke.punchline)) {
                        EmojiView(for :joke.rating)
                        Text(joke.setup)
                    }
                }.onDelete(perform: removeJokes)
            }.navigationBarTitle("Starbucks Now")
                .navigationBarItems(leading:EditButton(), trailing: Button("Add"){
                    self.showingAddJoke.toggle()
                })
                .sheet(isPresented: $showingAddJoke) {
                    AddView().environment(\.managedObjectContext,self.moc)
                  }
            }*/
        }
    func removeJokes(at offsets:IndexSet){
        for index in offsets{
            let joke = jokes[index]
            moc.delete(joke)
        }
        try? moc.save()
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
