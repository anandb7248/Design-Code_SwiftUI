//
//  TabBar.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/14/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            CourseList().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
