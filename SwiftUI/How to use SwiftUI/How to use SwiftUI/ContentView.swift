//
//  ContentView.swift
//  How to use SwiftUI
//
//  Created by Kim TaeSoo on 2021/10/19.
//

import SwiftUI

struct Hackathon: Identifiable {
    var id = UUID()
    var name: String
}

struct HackathonRow: View {
    var hackathon: Hackathon
    var body: some View {
        Text("Hackathon: \(hackathon.name)")
    }
}

struct ContentView: View {
    var body: some View {
        let first = Hackathon(name: "iOS")
        let second = Hackathon(name: "Android")
        let third = Hackathon(name: "Weight training")
        let hackathons = [first, second, third]
        return List(hackathons) { Hackathon in
            HackathonRow(hackathon: Hackathon)
        }
    
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
