//
//  MenuView.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/13/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 20) {
                Text("Anand - 28% complete")
                    .font(.caption)
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24).background(Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                InfoView(iconName: "gear", label: "Account")
                InfoView(iconName: "creditcard", label: "Billing")
                InfoView(iconName: "person.crop.circle", label: "Sign out")
            }.frame(maxWidth: .infinity)
                .frame(height: 300)
                .background(BlurView(style: .systemMaterial))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .padding().overlay(
                    Image("Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .offset(y: -150)
            )
        }.padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct InfoView: View {
    let iconName: String
    let label: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: iconName)
                .font(.system(size: 25, weight: .light, design: .rounded))
                .imageScale(.large).frame(width: 32, height: 32).foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            Text(label)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
