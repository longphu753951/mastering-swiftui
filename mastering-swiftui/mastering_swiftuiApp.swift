//
//  mastering_swiftuiApp.swift
//  mastering-swiftui
//
//  Created by User on 2/10/25.
//

import SwiftUI
import SwiftData

@main
struct mastering_swiftuiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            Chapter4_LayoutView()
        }
        .modelContainer(sharedModelContainer)
    }
}
