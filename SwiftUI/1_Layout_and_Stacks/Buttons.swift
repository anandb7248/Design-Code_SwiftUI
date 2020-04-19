//
//  Buttons.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/18/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
}

struct Buttons: View {
    
    var body: some View {
        VStack(spacing: 50) {
            RectangleButton()
            
            CircleButton()
            
            PayButton()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.7466478311, green: 0.8120542407, blue: 0.8369130949, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
    }
}
// #colorLiteral(red: 0.761, green: 0.816, blue: 0.926, alpha: 1)

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}

struct RectangleButton: View {
    @State var tap = false
    @State var press = false
    
    var body: some View {
        Text("Button")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: 200, height: 60)
            .background(
                ZStack {
                    Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.761, green: 0.816, blue: 0.926, alpha: 1))
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(Color(press ? #colorLiteral(red: 0.761, green: 0.816, blue: 0.926, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(
                            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.761, green: 0.816, blue: 0.926, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                        .padding(2)
                        .blur(radius: 2)
                }
        )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay(
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(press ? Color.white.opacity(0) : .white)
                        .frame(width: press ? 60 : 54, height: press ? 5 : 50)
                        .background(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.2), radius: 10, x: 10, y: 10)
                        .offset(x: press ? 70 : -5, y: press ? 16 : 0)
                    Spacer()
                }
        )
            .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.761, green: 0.816, blue: 0.926, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: Color(press ? #colorLiteral(red: 0.761, green: 0.816, blue: 0.926, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            .scaleEffect(tap ? 0.8 : 1)
            .gesture(
                LongPressGesture(minimumDuration: 0.5, maximumDistance: 10).onChanged({ (value) in
                    self.tap = true
                    impact(style: .heavy)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.tap = false
                    }
                })
                    .onEnded({ (value) in
                        self.press.toggle()
                        haptic(type: .success)
                    })
        )
    }
}

struct CircleButton: View {
    @State var tap = false
    @State var press = false
    
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: "moon")
                .font(.system(size: 44, weight: .light))
                    .offset(x: press ? 0: -90)
                    .offset(y: press ? 0: -90)
                .rotation3DEffect(Angle(degrees: press ? 0 : 20), axis: (x: -10, y: 10, z: 0))
                
                Image(systemName: "sun.max")
                    .font(.system(size: 44, weight: .light))
                    .offset(x: press ? 90 : 0)
                    .offset(y: press ? 90 : 0)
                    .rotation3DEffect(Angle(degrees: press ? 20 : 0), axis: (x: 10, y: -10, z: 0))
            }
        }
        .frame(width: 100, height: 100)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [ press ? Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)) : Color.white, press ? Color.white : Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: press ? Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)) : Color.white, radius: 3, x: -5, y: -5)
                    
                    Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: press ? Color.white : Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)), radius: 3, x: 3, y: 3)
            }
        )
            .clipShape(Circle())
            .scaleEffect(tap ? 0.8 : 1)
            .shadow(color: press ? Color.white : Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)), radius: 20, x: 20, y: 20)
            .shadow(color: press ? Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)) : Color.white, radius: 20, x: -20, y: -20)
            .gesture(LongPressGesture().onChanged({ (value) in
                self.tap = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.tap = false
                }
            })
                .onEnded({ (value) in
                    self.press.toggle()
                }))
    }
}

struct PayButton: View {
    @GestureState var tap = false
    @State var press = false
    
    var body: some View {
        ZStack {
            Image("fingerprint")
                .opacity(press ? 0 : 1)
                .scaleEffect(press ? 0 : 1)
            
            Image("fingerprint-2")
                .clipShape(Rectangle().offset(y: tap ? 0: 50))
                .animation(.easeInOut)
            .opacity(press ? 0 : 1)
            .scaleEffect(press ? 0 : 1)
            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 44, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .opacity(press ? 1 : 0)
            .scaleEffect(press ? 1 : 0)
            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
        }
        .frame(width: 120, height: 120)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [ press ? Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)) : Color.white, press ? Color.white : Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: press ? Color.white : Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)), radius: 3, x: -5, y: -5)
                    
                    Circle()
                    .stroke(Color.clear, lineWidth: 10)
                        .shadow(color: press ? Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)) : Color.white, radius: 3, x: 3, y: 3)
            }
        )
            .clipShape(Circle())
        .overlay(
            Circle()
                .trim(from: tap ? 0.001 : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 88, height: 88)
                .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 5, x: 3, y: 3)
                .animation(.easeInOut)
        )
            .scaleEffect(tap ? 0.8 : 1)
            .shadow(color: press ? Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)) : Color.white, radius: 20, x: -20, y: -20)
            .shadow(color: press ? Color.white : Color(#colorLiteral(red: 0.8607950369, green: 0.926, blue: 0.9130381498, alpha: 1)), radius: 20, x: 20, y: 20)
            .gesture(LongPressGesture()
                .updating($tap){ (currentState, gestureState, transaction) in
                    gestureState = currentState
                    impact(style: .heavy)
                }
            .onEnded({ (value) in
                self.press.toggle()
                haptic(type: .success)
            }))
    }
}
