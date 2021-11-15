//
//  toDoListApp.swift
//  toDoList
//
//  Created by Kim TaeSoo on 2021/10/26.
//

import SwiftUI

@main
struct toDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
