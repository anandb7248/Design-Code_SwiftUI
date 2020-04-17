//
//  CourseDetail.swift
//  1_Layout_and_Stacks
//
//  Created by Anand Batjargal on 4/17/20.
//  Copyright © 2020 anandbatjargal. All rights reserved.
//

import SwiftUI

struct CourseDetail: View {
    var courseInfo: Course
    @Binding var show: Bool
    @Binding var active: Bool
    @Binding var activeIndex: Int
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8.0) {
                            Text(courseInfo.title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            Text(courseInfo.subtitle)
                                .foregroundColor(Color.white.opacity(0.7))
                        }
                        Spacer()
                        
                        ZStack {
                            Image(systemName: "xmark")
                            .frame(width: 42, height: 42)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                            .opacity(show ? 1: 0)
                            .onTapGesture {
                                    self.show = false
                                    self.activeIndex = -1
                                    self.active = false
                            }
                        }
                    }
                    Spacer()
                    Image(uiImage: courseInfo.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 140, alignment: .top)
                }
                .padding(show ? 30 : 20)
                .padding(.top, show ? 30 : 0)
            //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height: 280)
                    .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 460 : 280)
                    .background(Color(courseInfo.color))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(courseInfo.color).opacity(0.3), radius: 20, x: 0, y: 20)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                    
                    Text("About this course")
                        .font(.title).bold()
                    
                    Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    
                    Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
                }.padding(30)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail(courseInfo: courseData[0], show: .constant(true), active: .constant(true), activeIndex: .constant(-1))
    }
}
