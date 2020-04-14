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
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            HomeView(showMenu: $showMenu)
                .padding(.top, 44)
                .background(Color.white)
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
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
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
