//  Created by somsak on 8/10/2567 BE.

import SwiftUI

@main
struct maraudersApp: App {
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
            .environmentObject(appRootManager)
        }
    }
}
