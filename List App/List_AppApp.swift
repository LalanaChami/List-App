//
//  List_AppApp.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import SwiftUI
import CoreData

@main
struct List_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ItemScreen()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
