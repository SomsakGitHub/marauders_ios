//
//  MainTabView.swift
//  marauderS
//
//  Created by somsak on 5/5/2568 BE.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
        
        TabView(selection: $selectedTabIndex) {
            FeedSceneView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTabIndex == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTabIndex == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear {
                    selectedTabIndex = 0
                }
                .tag(0)
            Text("Location")
                .tabItem {
                    VStack {
                        Image(systemName: selectedTabIndex == 1 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTabIndex == 1 ? .fill : .none)
                        Text("Location")
                    }
                }
                .onAppear {
                    selectedTabIndex = 1
                }
                .tag(1)
        }
        .tint(.black)
//        TabView {
//            ZStack {
//                PlayerView()
//                HStack {
//                    Spacer()
//                    ReactionButtons1View()
//                }
//                .frame(width: UIScreen.main.bounds.width)
//            }
//            
//            ZStack {
//                ThirdVideoView()
//                HStack {
//                    Spacer()
//                    ReactionButtons3View()
//                }
//                .frame(width: UIScreen.main.bounds.width)
//            }
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}
