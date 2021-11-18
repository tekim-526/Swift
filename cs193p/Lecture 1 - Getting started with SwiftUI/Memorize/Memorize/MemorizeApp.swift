//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kim TaeSoo on 2021/11/09.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
