//
//  UpdateDetail.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/14/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = updateData[1]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(update.image)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }.padding().navigationBarTitle(update.title)
        }
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
