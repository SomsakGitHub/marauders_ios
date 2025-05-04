//
//  VTabView.swift
//  marauderS
//
//  Created by somsak02061 on 4/5/2568 BE.
//

import SwiftUI

struct VTabView: View {
    var body: some View {
        TabView {
            ZStack {
                PlayerView()
                HStack {
                    Spacer()
                    ReactionButtons1View()
                }
                .frame(width: UIScreen.main.bounds.width)
            }
            
//            ZStack {
//                ThirdVideoView()
//                HStack {
//                    Spacer()
//                    ReactionButtons3View()
//                }
//                .frame(width: UIScreen.main.bounds.width)
//            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
    }
}

#Preview {
    VTabView()
}
