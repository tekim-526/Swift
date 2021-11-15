//
//  ContentView.swift
//  Picker
//
//  Created by Kim TaeSoo on 2021/10/21.
//

import SwiftUI

struct ContentView: View {
    var colors = ["red", "blue", "orange", "pink"]
    @State var selectedColor = 0
    var body: some View {
        VStack {
            Picker(selection: $selectedColor, label: Text("Choose a color")) {
                ForEach(0 ..< colors.count) {
                    Text(self.colors[$0])
                }
            }
            Text("You Selected \(colors[selectedColor])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
