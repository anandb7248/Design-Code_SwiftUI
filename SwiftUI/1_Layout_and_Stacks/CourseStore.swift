//
//  CourseStore.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/17/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "0ge8xzmnbp2c", accessToken: "03010b0d79abcb655ca3fda453f2f493b5472e0aaa53664bc7dea5ef4fce2676")

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case.success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .error(let error):
            print("Error: \(error)")
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData

    init() {
         let colors = [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)]
        
        getArray(id: "courses") { (items) in
            items.forEach { (item) in
                self.courses.append(Course(
                    title: "Anand",
                    subtitle: item.fields["subtitle"] as! String,
                    image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                    logo: #imageLiteral(resourceName: "Logo1"),
                    color: colors.randomElement()!,
                    show: false))
            }
        }
    }
}
