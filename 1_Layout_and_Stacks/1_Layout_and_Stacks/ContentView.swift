//
//  ContentView.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/10/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: 20)
            
            BackCardView()
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 40)
                .offset(x: 0, y: -40)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: 10))
                .rotation3DEffect(.degrees(10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
            
            BackCardView()
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 40)
                .offset(x: 0, y: -20)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: 5))
                .rotation3DEffect(.degrees(10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
            
            CardView()
                .blendMode(.hardLight)
            
            BottomCardView()
                .blur(radius: 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("Certificate")
                        .font(.headline)
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding()
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill).frame(width: 300, height: 120, alignment: .top)
        }
        .frame(width: 340.0, height: 220.0)
        .background(Color.black)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }.frame(width: 340.0, height: 220.0)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 60, height: 5)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Anand Batjargal has achieved the UI Design course approval from a Design+code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            Spacer()
        }.padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(x: 0, y: 540)
    }
}
