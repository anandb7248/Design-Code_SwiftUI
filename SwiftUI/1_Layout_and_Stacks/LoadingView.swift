//
//  LoadingView.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/18/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(filename: "loading")
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
