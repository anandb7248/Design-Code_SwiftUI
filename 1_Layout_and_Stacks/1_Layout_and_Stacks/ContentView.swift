//
//  ContentView.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/10/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFullCard = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
            )
            
            BackCardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 40)
                .offset(x: 0, y: show ? -300 : -30)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -240 : 0)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: showCard ? 0 : 10))
                .rotation3DEffect(.degrees(showCard ? 360 : 10), axis: (x: 0, y: 1, z: 1))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.45))
            
            BackCardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 40)
                .offset(x: 0, y: show ? -160 : -15)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -190 : 0)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: showCard ? 0 : 10))
                .rotation3DEffect(.degrees(showCard ? 360 : 10), axis: (x: 0, y: 1, z: 1))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.4))
            
            CardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20))
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -150 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
            }.gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                    self.show = true
                }.onEnded({ (value) in
                    self.viewState = .zero
                    self.show = false
                })
            )
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 360: 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .gesture(
                DragGesture().onChanged({ (value) in
                    self.bottomState = value.translation
                }).onEnded( { value in
                    if self.bottomState.height > 150{
                        self.showCard = false
                    }
                    if self.bottomState.height < -200 {
                        self.bottomState.height = -300
                        self.showFullCard = true
                    }else{
                        self.bottomState = .zero
                        self.showFullCard = false
                    }
                }
                )
            )
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
                    Text("Anand Batjargal")
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
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
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
    }
}
