//
//  FeedViewModel.swift
//  marauderS
//
//  Created by somsak on 5/5/2568 BE.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var data: DataType?
    
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
    
    func fetchData() async {
        do {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(DataType.self, from: data)
            DispatchQueue.main.async {
                self.data = decodedData
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

struct DataType: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
