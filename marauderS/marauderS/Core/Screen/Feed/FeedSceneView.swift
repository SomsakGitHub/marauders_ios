//
//  FeedSceneView.swift
//  marauderS
//
//  Created by somsak on 30/4/2568 BE.
//

import SwiftUI
import AVFoundation

struct FeedSceneView: View {
    
//    @State var top = 0
//    @State private var isLocalVideoShowing = false
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.posts) { post in
                    FeedCellSceneView(post: post, player: player)
                        .id(post.id)
                        .onAppear { playInitialVideoIfNecessary() }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear{player.play()}
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            print("DEBUG: Scroll position changed to: \(newValue)")
            playVideoOnChangeOfScrollPosition(postId: newValue)
        }
        
//        NavigationStack {
//            ZStack {
//                VTabView().padding(.top, -200)
//            }
//            .toolbar {
//                ToolbarItemGroup {
//                    Button {
//                        
//                    } label: {
//                        Image(systemName: "magnifyingglass")
//                    }
//                    .buttonStyle(.plain)
//                }
//                
//                ToolbarItemGroup(placement: .bottomBar) {
//                    Button {
//                        
//                    } label: {
//                        VStack {
//                            Image(systemName:  "house.fill")
//                            Text("Home")
//                                .font(.caption)
//                        }
//                    }
//                    .buttonStyle(.plain)
//                    
//                    Spacer()
//                    
//                    Button {
//                        
//                    } label: {
//                        VStack {
//                            Image(systemName:  "person.2")
//                            Text("Friends")
//                                .font(.caption)
//                        }
//                    }
//                    .buttonStyle(.plain)
//                    
//                    Spacer()
//                    
//                    Button {
//                        isLocalVideoShowing.toggle()
//                    } label: {
//                        Image(systemName: "plus.rectangle.fill")
//                    }
//                    .font(.title3)
//                    .buttonStyle(.plain)
//                    .foregroundStyle(.black)
//                    .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
//                    .background(LinearGradient(gradient: Gradient(colors: [.teal, .red]), startPoint: .leading, endPoint: .trailing))
//                    .cornerRadius(6)
//                    
//                    Spacer()
//                    
//                    Button {
//                        
//                    } label: {
//                        VStack {
//                            Image(systemName:  "tray")
//                            Text("Inbox")
//                                .font(.caption)
//                        }
//                    }
//                    .buttonStyle(.plain)
//                    
//                    Spacer()
//                    
//                    Button {
//                        
//                    } label: {
//                        VStack {
//                            Image(systemName:  "person")
//                            Text("Profile")
//                                .font(.caption)
//                        }
//                    }
//                    .buttonStyle(.plain)
//                }
//            }
//        }
    }
    
    func playInitialVideoIfNecessary(){
        guard scrollPosition == nil, let post = viewModel.posts.first, player.currentItem == nil else { return }
        let item = AVPlayerItem(url: post.videoUrl)
        player.replaceCurrentItem(with: item)
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String?){
        guard let currentPostId = viewModel.posts.first(where: { $0.id == postId}) else { return }
        
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: currentPostId.videoUrl)
        player.replaceCurrentItem(with: playerItem)
//        player.play()
    }
}

#Preview {
    FeedSceneView()
}
