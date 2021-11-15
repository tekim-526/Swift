//
//  ContentView.swift
//  NavigationView
//
//  Created by Kim TaeSoo on 2021/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: NavigationDetailView()) {
                Text("Hello World!")
            }.navigationBarTitle("tekim's iOS")
        }
    }
}
struct NavigationDetailView: View {
    var body: some View {
        VStack() {
            Text("tekim")
        }.navigationBarTitle("iOS")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
