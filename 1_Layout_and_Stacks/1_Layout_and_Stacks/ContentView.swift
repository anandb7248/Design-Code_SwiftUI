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
            VStack {
                Spacer()
            }.frame(width: 300.0, height: 220.0)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(radius: 40).offset(x: 0, y: -20)
            
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
