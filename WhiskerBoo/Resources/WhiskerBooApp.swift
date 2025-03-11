//
//  WhiskerBooApp.swift
//  WhiskerBoo
//
//  Created by Lovice Sunuwar on 05/03/2025.
//

import SwiftUI
import Firebase

@main
struct WhiskerBooApp: App {
    let persistenceController = PersistenceController.shared
    
    // MARK: - Initalizers
    
    init(){
        FirebaseApp.configure()
        print("Configured Firebase")
    }

    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
