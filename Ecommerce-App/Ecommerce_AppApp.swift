//
//  Ecommerce_AppApp.swift
//  Ecommerce-App
//
//  Created by indianrenters on 27/06/25.
//

import SwiftUI

@main
struct Ecommerce_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
