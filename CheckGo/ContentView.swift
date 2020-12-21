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
    @State var tip = 0
    let tipAmount = [0, 5, 10, 15, 20, 25]
    //propetry wrapper is a solution to change values while program runs
    //furthermore it allow us to store value in the place in SwiftUI
    //that can be modified
    //@state is for simple properties that will store only on one view
    
    var amountPerPerson: Double {
        //if no food declared = price insta 0
        let dishConvertedPrice = Double(dishPrice) ?? 0
        let tipConverted = Double(tipAmount[tip])
        let personConverted = Double(personInGroup + 1)
        //because person count started from 0, nor a 1
        let dishConvertedCount = Double(dishCount)
        
        let totalPrice = (dishConvertedPrice * dishConvertedCount)
        //total price of all food
        let totalTip = totalPrice * tipConverted / 100
        //total tip for all food
        let pricePerPerson = (totalPrice + totalTip) / personConverted
        return pricePerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("Select your dishes price:", text: $dishPrice).keyboardType(.decimalPad)
                    //$ sign before means that we will rewrite variable, not only read
                    Text("You price: \(dishPrice)")
                    //and here we need only to read variable
                    }
                Section {
                    Button("Plus"){
                        self.dishCount+=1
                    }
                    Text("Currently dishes: \(dishCount)")
                    Button("Minus"){
                        if dishCount == 0{
                            
                        }else{
                        self.dishCount-=1
                        }}}
                Section(header: Text("How much person with you")) {
                    Picker("Choose number of person", selection: $personInGroup){
                        ForEach(1..<5){
                            Text("\($0) person")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Picker("Choose tip amount", selection: $tip){
                        ForEach(0..<tipAmount.count){
                            Text("\(self.tipAmount[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Text("Each person should pay \(amountPerPerson, specifier: "%.2f")$")
            }.navigationBarTitle("CheckGO", displayMode: .large)
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
