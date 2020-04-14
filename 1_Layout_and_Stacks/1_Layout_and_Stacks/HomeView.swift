//
//  HomeView.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/13/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching").font(.system(size: 28, weight: .bold))
                Spacer()
                AvatarView(showMenu: $showMenu)
            }.padding(.horizontal)
                .padding(.top, 30)
                .padding(.leading, 14)
            
            // Horizontal Scroll
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30){
                    ForEach(0 ..< 3) { item in
                        SectionView()
                    }
                }.padding(30).padding(.bottom, 30)
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showMenu: .constant(false))
    }
}

struct SectionView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text("Prototype designs in SwiftUI")
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image("Logo1")
            }
            Text("18 Sections".uppercased())
                .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.white)
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }.padding(.top, 20)
            .padding(.horizontal, 20)
            .frame(width: 275, height: 275)
            .background(Color("card1"))
            .cornerRadius(30)
            .shadow(color: Color("card1")
                .opacity(0.5), radius: 20, x: 0, y: 20)
    }
}
