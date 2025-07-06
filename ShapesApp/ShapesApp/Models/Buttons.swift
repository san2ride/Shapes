//
//  Buttons.swift
//  ShapesApp
//
//  Created by Jason Sanchez on 7/6/25.
//

import Foundation

struct ButtonResponse: Codable {
    let buttons: [Buttons]
}

// MARK: - JSON Structure Mapping
struct Buttons: Codable, Identifiable {
    let id = UUID()
    let name: String
    let drawPath: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case drawPath = "draw_path"
    }
    // MARK: - DrawPath values
    enum DrawPath: String {
        case circle, square, triangle
    }
    var drawPathType: DrawPath? {
        DrawPath(rawValue: drawPath)
    }
}

enum ShapeType {
    case circle, square, triangle
}

// MARK: - GridShape type and position
struct GridShape: Identifiable {
    let id = UUID()
    let type: ShapeType
    let position: CGPoint
}
