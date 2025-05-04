//
//  HomeSceneView.swift
//  marauderS
//
//  Created by somsak on 30/4/2568 BE.
//

import SwiftUI

struct HomeSceneView: View {
    
    let posts: [FeedPost] = [
        FeedPost(username: "jane_doe", content: "Loving the new SwiftUI updates!", timestamp: "2h", profileImage: "person.circle"),
        FeedPost(username: "dev_guy", content: "Just pushed my latest project to GitHub 🚀", timestamp: "5h", profileImage: "person.crop.circle.fill"),
        FeedPost(username: "catlover", content: "My cat just knocked over my coffee... again.", timestamp: "1d", profileImage: "person.crop.circle")
    ]

    var body: some View {
        NavigationView {
            List(posts) { post in
                FeedPostView(post: post)
            }
            .listStyle(.plain)
            .navigationTitle("Home Feed")
        }
    }
}

#Preview {
    HomeSceneView()
}

struct FeedPost: Identifiable {
    let id = UUID()
    let username: String
    let content: String
    let timestamp: String
    let profileImage: String
}

struct FeedPostView: View {
    let post: FeedPost

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: post.profileImage)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .foregroundColor(.blue)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(post.username)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(post.timestamp)
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Text(post.content)
            }
            .padding(.vertical, 4)
        }
        .padding(.vertical, 6)
    }
}
