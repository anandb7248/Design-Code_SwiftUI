//
//  RingView.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/14/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var color1  = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    var color2  = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    var width: CGFloat = 300
    var height: CGFloat = 300
    var percent: CGFloat = 50
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent/100)
        
        return ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: CGFloat(5 * multiplier))).frame(width: CGFloat(width), height: CGFloat(height))
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .trailing, endPoint: .leading),
                        style: StrokeStyle(lineWidth: CGFloat(5 * multiplier), lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0)).frame(width: CGFloat(width), height: CGFloat(height))
                .shadow(color: Color.blue.opacity(0.1), radius: CGFloat(3 * multiplier), x: 0, y: CGFloat(3 * multiplier))

            
            Text("\(Int(percent))%")
                .font(.system(size: CGFloat(14 * multiplier)))
                .fontWeight(.bold)
                .onTapGesture {
                    self.show.toggle()
            }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
