//
//  MaraudersApp.swift
//  Marauders
//
//  Created by somsak on 17/10/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct MaraudersApp: App {
    @StateObject private var appRootManager = AppRootManager()
    
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
            Group {
                switch appRootManager.currentRoot {
                case .login:
                    LoginView()
                case .home:
                    HomeView()
                        .transition(.scale.animation(.easeInOut(duration: 0.5)))
                }
            }
        }
        .modelContainer(sharedModelContainer)
        .environmentObject(appRootManager)
    }
}

//struct MaraudersApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//}
