//
//  ReactionButtonsView.swift
//  TikTokCloneSwiftUI
//
//  Created by Amos Gyamfi on 31.5.2024.
//

import SwiftUI

struct ReactionButtons1View: View {
    var body: some View {
        VStack(spacing: 24) {
            Button {
                
            } label: {
                Image(.profile)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                    )
            }
            
            Button {
                
            } label: {
                VStack {
                    Image(systemName: "suit.heart.fill")
                        .font(.title)
                    
                    Text("5K")
                }
                .foregroundStyle(.white)
            }
            
            Button {
                
            } label: {
                VStack {
                    Image(systemName: "message.fill")
                        .font(.title)
                    
                    Text("56")
                }
                .foregroundStyle(.white)
            }
            
            Button {
                
            } label: {
                VStack {
                    Image(systemName: "square.and.arrow.up.fill")
                        .font(.title)
                    
                    Text("Share")
                }
                .foregroundStyle(.white)
            }
        }
        .padding()
    }
}

#Preview {
    ReactionButtons1View()
        .preferredColorScheme(.dark)
}
