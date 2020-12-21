//
//  ContentView.swift
//  CheckGo
//
//  Created by Максим on 20.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dishCount = 0
    //propetry wrapper is a solution to change values while program runs
    //furthermore it allow us to store value in the place in SwiftUI
    //that can be modified
    //@state is for simple properties that will store only on one view
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Text("Hello, world!")
                    }
                HStack{
                    Button("Plus"){
                        self.dishCount+=1
                    }
                    Spacer()
                    Text("Currently dishes: \(dishCount)")
                    Spacer()
                    Button("Minus"){
                        self.dishCount-=1
                    }
                }}.navigationBarTitle("CheckGO", displayMode: .large)
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
