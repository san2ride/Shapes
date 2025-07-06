//
//  ShapeGridView.swift
//  ShapesApp
//
//  Created by Jason Sanchez on 7/6/25.
//

import SwiftUI

struct ShapeGridView: View {
    @StateObject private var vm = ShapesGridViewModel()
    
    var body: some View {
        NavigationStack {
            ShapeView(gridShapes: vm.gridShapes)
                .padding()
                .toolbar {
                    // MARK: Clear All Button
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Clear All") {
                            vm.clearShapes()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink("Edit Circles") {
                            EditCirclesView()
                        }
                    }
                }
        }
    }
}

#Preview {
    ShapeGridView()
}
