//
//  ContentView.swift
//  Day02-03 - todoList
//
//  Created by Kim TaeSoo on 2021/10/26.
//

import SwiftUI

struct FamilyRow: View {
    var name: String

    var body: some View {
        Text("Family: \(name)")
    }
}

struct ContentView: View {
    var body: some View {
        List {
            FamilyRow(name: "Hohyeon")
            FamilyRow(name: "Gomin")
            FamilyRow(name: "Durup")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
