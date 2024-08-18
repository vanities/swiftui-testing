//
//  ZoomTransitions.swift
//  swiftui-testing
//
//  Created by Adam Mischke on 8/18/24.
//

import SwiftUI

struct ZoomTransitionView: View {
    let colors: [[Color]] = [
        [.red, .blue, .green],
        [.yellow, .purple, .brown],
        [.cyan, .gray]
    ]
    @Namespace() var namespace
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Grid(horizontalSpacing: 50, verticalSpacing: 50) {
                ForEach(colors, id: \.hashValue) { rowColors in
                    GridRow {
                        ForEach(rowColors, id: \.self) { color in
                            NavigationLink {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(color)
                                    .navigationTransition(
                                        .zoom(
                                            sourceID: color,
                                            in: namespace
                                        )
                                    )
                            } label: {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundStyle(color)
                                    .frame(width: 48, height: 48)
                            }
                            .matchedTransitionSource(id: color, in: namespace)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ZoomTransitionView()
}
