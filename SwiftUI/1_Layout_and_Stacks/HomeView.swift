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
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))

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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .onTapGesture {
                            self.showContent = true
                    }
                }
                
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
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }.offset(y: -50)
                
                HStack {
                    Text("Courses")
                        .font(.title).bold()
                    Spacer()
                }.padding(.leading, 30)
                    .offset(y: -60)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                .offset(y: -60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showMenu: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    let section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
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
            .frame(width: width, height: height)
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

struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30.0) {
            HStack {
                RingView(color1: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), color2: #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), width: 44, height: 44, percent: 78, show: .constant(true))
                    .animation(Animation.easeInOut.delay(0.4))
                
                VStack(alignment: .leading, spacing: 5.0) {
                    Text("6 minutes left")
                        .modifier(FontModifier(style: .subheadline))
                    
                    Text("Watched 10 mins today")
                        .modifier(FontModifier(style: .caption))
                }
                
            }.padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            
            HStack {
                RingView(color1: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), color2: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), width: 32, height: 32, percent: 50, show: .constant(true))
                    .animation(Animation.easeInOut.delay(0.4))
            }.padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
            
            HStack {
                RingView(color1: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), color2: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), width: 32, height: 32, percent: 66, show: .constant(true))
                    .animation(Animation.easeInOut.delay(0.4))
            }.padding(8)
                .background(Color.white)
                .cornerRadius(20)
                .modifier(ShadowModifier())
        }
    }
}
