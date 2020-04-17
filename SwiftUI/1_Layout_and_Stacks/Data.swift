//
//  Data.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/17/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct Post: Identifiable, Codable {
    let id = UUID()
    let title: String
    let body: String
}

class API {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard (error == nil) else { return }
            guard let data = data else { return }
            
            let posts = try! JSONDecoder().decode([Post].self, from: data)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
}
