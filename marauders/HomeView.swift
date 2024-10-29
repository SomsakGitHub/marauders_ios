//
//  HomeView.swift
//  Marauders
//
//  Created by somsak on 17/10/2567 BE.
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
