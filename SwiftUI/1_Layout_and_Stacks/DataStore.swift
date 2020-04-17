//
//  DataStore.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/17/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        API().getPosts { (posts) in
            self.posts = posts
        }
    }
}
