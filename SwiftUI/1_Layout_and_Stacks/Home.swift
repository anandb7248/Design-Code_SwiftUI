//
//  Home.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/13/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showMenu = false
    @State var viewState = CGSize.zero
    @State var showContent = false
    
    var body: some View {
        ZStack {
            Color("background2")
                .edgesIgnoringSafeArea(.all)
            
            HomeView(showMenu: $showMenu, showContent: $showContent)
                .padding(.top, 44)
                .background(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color("background2"), Color("background1")]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                        Spacer()
                    }.background(Color("background1"))
                )
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showMenu ? -450: 0)
                .rotation3DEffect(Angle(degrees: showMenu ? Double(viewState.height / 5) - 10 : 0), axis: (x: 10, y: 0, z: 0))
                .scaleEffect(showMenu ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                    .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.0001))
                .offset(y: showMenu ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)).onTapGesture {
                    self.showMenu.toggle()
            }.gesture(
                DragGesture().onChanged({ (value) in
                    self.viewState = value.translation
                }).onEnded({ (value) in
                    if self.viewState.height > 50 {
                        self.showMenu = false
                    }
                    self.viewState = .zero
                })
            )
            
            if showContent {
                BlurView(style: .systemMaterial)
                    .edgesIgnoringSafeArea(.all)
                
                ContentView()
                
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                        .frame(width: 36, height: 36)
                        .foregroundColor(.white)
                        .background(Color.black)
                            .clipShape(Circle())
                    }
                    Spacer()
                }.offset(x: -16, y: 16)
                    .transition(.move(edge: .top))
                    .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                    .onTapGesture {
                        self.showContent = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environment(\.colorScheme, .dark)
    }
}

struct AvatarView: View {
    // Binding maintains no ownership, only has read/write access
    // Binding is a variable reference to a parent State variable
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            self.showMenu.toggle()
        }) {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36).clipShape(Circle())
        }
    }
}


let screen = UIScreen.main.bounds
