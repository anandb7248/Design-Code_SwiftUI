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
    @State var showUpdate = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching").font(.system(size: 28, weight: .bold))
                Spacer()
                AvatarView(showMenu: $showMenu)
                
                Button(action: { self.showUpdate.toggle() }) {
                    Image(systemName: "bell")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }.sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            }.padding(.horizontal)
                .padding(.top, 30)
                .padding(.leading, 14)
            
            // Horizontal Scroll
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0){
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -10
                                ), axis: (x: 0, y: 10, z: 0))
                        }.frame(width: 275, height: 275)
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
    let section: Section
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image("Logo1")
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(.white)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }.padding(.top, 20)
            .padding(.horizontal, 20)
            .frame(width: 275, height: 275)
            .background(section.color)
            .cornerRadius(30)
            .shadow(color: section.color
                .opacity(0.5), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    let id = UUID()
    let title: String
    let text: String
    let logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo1", image: Image("Card1"), color: Color("card1")),
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo2", image: Image("Card2"), color: Color("card2")),
    Section(title: "Prototype designs in SwiftUI", text: "18 Sections", logo: "Logo3", image: Image("Card3"), color: Color("card3"))
]
