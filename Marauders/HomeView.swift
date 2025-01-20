//
//  File.swift
//  Marauders
//
//  Created by somsak02061 on 20/1/2568 BE.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            // First Tab
            Text("Home Screen")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // Second Tab
            Text("Settings Screen")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    HomeView()
}
