//
//  MaraudersApp.swift
//  Marauders
//
//  Created by somsak on 8/1/2568 BE.
//

import SwiftUI
import SwiftData

@main
struct MaraudersApp: App {
    @StateObject private var appRootManager = AppRootManager()

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
        .environmentObject(appRootManager)
    }
}

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: eAppRoots = .login
    
    enum eAppRoots {
        case login
        case home
    }
}
