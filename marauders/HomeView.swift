//  Created by somsak on 8/10/2567 BE.

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

struct HomeViewContentView: View {
    var body: some View {
        HomeView()
    }
}

struct HomeViewContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewContentView()
    }
}

