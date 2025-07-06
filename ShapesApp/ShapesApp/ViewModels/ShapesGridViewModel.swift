//
//  ShapesGridViewModel.swift
//  ShapesApp
//
//  Created by Jason Sanchez on 7/6/25.
//

import Foundation
import SwiftUI

@MainActor
class ShapesGridViewModel: ObservableObject {
    @Published var buttons: [Buttons] = []
    @Published var gridShapes: [GridShape] = []
    @Published var errorMessage: String?
    
    private let gridSize: CGFloat = 50.0
    
    func loadButtons() async {
        do {
            let response = try await NetworkService().load(url: URLs.cricutURL)
            self.buttons = response
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    // MARK: - Draw Shape
    func addShape(_ type: ShapeType) {
        let position = nextShapePosition()
        gridShapes.append(GridShape(type: type, position: position))
    }
    // MARK: - Remove All Shapes
    func clearShapes() {
        gridShapes.removeAll()
    }
    // MARK: - Next Shape in the Grid
    private func nextShapePosition() -> CGPoint {
        let columns = Int(UIScreen.main.bounds.width / gridSize)
        let count = gridShapes.count
        let row = count / columns
        let col = count % columns
        return CGPoint(x: CGFloat(col) * gridSize + gridSize / 2, y: CGFloat(row) * gridSize + gridSize / 2)
    }
}
