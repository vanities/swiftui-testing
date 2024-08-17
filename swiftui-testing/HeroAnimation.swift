//
//  HeroAnimation.swift
//  swiftui-testing
//
//  Created by Adam Mischke on 8/17/24.
//

import SwiftUI

struct HeroAnimation: View {
    @State private var pickedColor: Color? = nil
    @Namespace private var colorAnimation

    var body: some View {
        ZStack {
            if let x = pickedColor {
                x
                    .matchedGeometryEffect(id: x, in: colorAnimation)
                    .onTapGesture {
                        pickedColor = nil
                    }

            } else {
                ScrollView {
                    image(.red)
                    image(.blue)
                    image(.yellow)
                    image(.green)
                }
            }
        }
    }

    func image(_ color: Color) -> some View {
        color.frame(width: 200, height: 200)
            .matchedGeometryEffect(id: color, in: colorAnimation)
            .onTapGesture {
                print("picked color \(color)")
                withAnimation(.linear(duration: 5)) {
                    pickedColor = color
                }
            }
    }
}


#Preview {
    HeroAnimation()
}
