//
//  ContentView.swift
//  CheckGo
//
//  Created by Максим on 20.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var dishName = ""
    @State private var dishCount = 0
    @State private var dishPrice = ""
    @State var personInGroup = 0
    let tipAmount = [0, 5, 10, 15, 20, 25]
    //propetry wrapper is a solution to change values while program runs
    //furthermore it allow us to store value in the place in SwiftUI
    //that can be modified
    //@state is for simple properties that will store only on one view
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("Select your dish:", text: $dishPrice).keyboardType(.decimalPad)
                    Text("You chose: \(dishPrice)")
                    }
                Section {
                    Button("Plus"){
                        self.dishCount+=1
                    }
                    Text("Currently dishes: \(dishCount)")
                    Button("Minus"){
                        self.dishCount-=1
                    }}
                Section {
                    Picker("Choose tip amount", selection: $personInGroup){
                        ForEach(1..<5){
                            Text("\($0) person in group")
                        }
                    }
                }
            }
                .navigationBarTitle("CheckGO", displayMode: .large)
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
