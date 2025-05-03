//
//  MainSceneView.swift
//  marauderS
//
//  Created by somsak02061 on 3/5/2568 BE.
//

import SwiftUI

struct MainSceneView: View {
    var body: some View {
        TabView {
            HomeSceneView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            SettingSceneView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MainSceneView()
}
