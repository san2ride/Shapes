//
//  ShapeView.swift
//  ShapesApp
//
//  Created by Jason Sanchez on 7/6/25.
//

import SwiftUI

struct ShapeView: View {
    let gridShapes: [GridShape]
    let gridSize: CGFloat = 50.0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(gridShapes) { shape in
                    Group {
                        switch shape.type {
                            case .circle:
                                Circle()
                                    .fill(.red)
                                    .frame(width: gridSize - 16, height: gridSize - 16)
                            case .square:
                                Rectangle()
                                    .fill(.blue)
                                    .frame(width: gridSize - 16, height: gridSize - 16)
                            case .triangle:
                                Triangle()
                                    .fill(.green)
                                    .frame(width: gridSize - 16, height: gridSize - 16)
                        }
                    }
                    .position(shape.position)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

// MARK: - Custom Triangle Shape
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}
