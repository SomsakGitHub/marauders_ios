//
//  TabBarView.swift
//  marauders
//
//  Created by somsak on 7/9/2567 BE.
//

import SwiftUI

struct TabBarView: View {
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

struct TabBarViewContentView: View {
    var body: some View {
        TabBarView()
    }
}

struct TabBarViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarViewContentView()
    }
}

