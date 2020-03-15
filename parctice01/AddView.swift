//
//  AddView.swift
//  parctice01
//
//  Created by hiwatt on 2020/03/15.
//  Copyright © 2020 hiwatt. All rights reserved.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var setup = ""
    @State private var punchline = ""
    @State private var rating = "Silence"
    let ratings = ["Sob","Sigh","Smirk","Silence"]
    
    var body: some View {
        NavigationView{
            //List{
            Form{
                Section{
                    TextField("Setup", text: $setup)
                    TextField("Puchline", text: $punchline)
                    Picker("Rating",selection:$rating){
                        ForEach(ratings, id: \.self){
                            rating in Text(rating)
                        }
                    }
                }
                Button("Add joke"){
                    let newJoke = Joke(context:self.moc)
                    newJoke.setup = self.setup
                    newJoke.punchline = self.punchline
                    newJoke.rating = self.rating
                    
                    do{
                        try self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }catch{
                        print("whoops \(error.localizedDescription)")
                    }
                }
            }.navigationBarTitle("New Joke")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
