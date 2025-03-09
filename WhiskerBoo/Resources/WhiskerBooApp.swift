//
//  WhiskerBooApp.swift
//  WhiskerBoo
//
//  Created by Lovice Sunuwar on 05/03/2025.
//

import SwiftUI

@main
struct WhiskerBooApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
