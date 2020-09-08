//
//  ListViewModel.swift
//  ColorListGuideApp
//
//  Created by Pongsakorn Praditkanok on 27/8/2563 BE.
//  Copyright © 2563 Ds42713. All rights reserved.
//

import Foundation
class ListViewModel: ObservableObject {
    @Published var posts = [PostViewModel]()
    
    init() {
        
        Services().getPosts { posts in
            
            if let posts = posts {
                self.posts = posts.map(PostViewModel.init)
            }
        }

    }
}

struct PostViewModel {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var id: Int {
        return self.post.id
    }
    
    var title: String {
        return self.post.title
    }
    
    var thumbnail: String {
        return self.post.thumbnail
    }
}
