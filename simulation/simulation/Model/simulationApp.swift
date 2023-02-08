//
//  simulationApp.swift
//  simulation
//
//  Created by 이다민 on 2022/10/12.
//

import SwiftUI
import Firebase

@main
struct simulationApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

