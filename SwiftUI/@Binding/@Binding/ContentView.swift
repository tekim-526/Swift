//
//  ContentView.swift
//  @Binding
//
//  Created by Kim TaeSoo on 2021/10/22.
//

import SwiftUI
import ARKit
struct PlayButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}

struct ContentView: View {
    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text("episode.title")
            Text("episode.showTitle")
            PlayButton(isPlaying: $isPlaying)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
