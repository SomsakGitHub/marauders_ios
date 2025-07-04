//
//  marauderSApp.swift
//  marauderS
//
//  Created by somsak on 30/4/2568 BE.
//

import SwiftUI
import SwiftData

@main
struct marauderSApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Destination.self)
    }
}

struct RootView: View {
    
    @StateObject var authentication = Authentication()

    var body: some View {
        if !authentication.isValidated {
            MainTabView().environmentObject(authentication)
        } else {
            LoginSceneView().environmentObject(authentication)
        }
    }
}
