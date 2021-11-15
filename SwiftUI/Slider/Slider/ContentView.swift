//
//  ContentView.swift
//  Slider
//
//  Created by Kim TaeSoo on 2021/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var celsius: Double = 0
    var body: some View {
        VStack {
            Slider(value: $celsius, in: -100...100, step: 0.1)
            Text("your grade is \(celsius)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
