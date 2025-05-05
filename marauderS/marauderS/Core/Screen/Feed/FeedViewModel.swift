//
//  FeedViewModel.swift
//  marauderS
//
//  Created by somsak on 5/5/2568 BE.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let videoUrls = [
        Bundle.main.url(forResource: "oneDancing", withExtension: "mp4")!,
        Bundle.main.url(forResource: "fireworks", withExtension: "mp4")!,
        Bundle.main.url(forResource: "selfie", withExtension: "mp4")!,
        Bundle.main.url(forResource: "threeDancing", withExtension: "mp4")!,
//        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
//        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
//        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
//        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
    ]
    
    init () {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[0]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[1]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[2]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[3]),
        ]
    }
}
