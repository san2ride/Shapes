//
//  ShapesGridViewModel.swift
//  ShapesApp
//
//  Created by Jason Sanchez on 7/6/25.
//

import Foundation
import SwiftUI

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
    // MARK: - Remove All Shapes
    func clearShapes() {
        gridShapes.removeAll()
    }
    
}
