//
//  ContentView.swift
//  CheckGo
//
//  Created by Максим on 20.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var dish = ""
    @State private var name = ""
    @State private var dishCount = 0
    //propetry wrapper is a solution to change values while program runs
    //furthermore it allow us to store value in the place in SwiftUI
    //that can be modified
    //@state is for simple properties that will store only on one view
    var body: some View {
        NavigationView{
            Form{
                Section{
                Text("Text Field for your name below")
                    TextField("Enter your name here: ", text: $name)
                Text("Enter your dish")
                    TextField("I took: ", text: $dish)
                    //$ tell swift that it should read the value of the property but also write it back as any changes happen.
            }
                Section{
                    Button("Plus"){
                    dishCount+=1
                }
                Text("Currently dish count is: \(dishCount)")
                Button("Minus"){
                    dishCount-=1
                }}
            }.navigationBarTitle("CheckGO", displayMode: .large)
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
