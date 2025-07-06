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
                    // MARK: - Clear All Button
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Clear All") {
                            vm.clearShapes()
                        }
                    }
                    // MARK: - Edit Circles Button
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink("Edit Circles") {
                            EditCirclesView()
                        }
                    }
                    //MARK: - Shapes Button Group
                    ToolbarItemGroup(placement: .bottomBar) {
                        HStack(spacing: 80) {
                            ForEach(vm.buttons) { button in
                                if let drawPath = button.drawPathType {
                                    Button(button.name) {
                                        switch drawPath {
                                            case .circle:
                                                vm.addShape(.circle)
                                            case .square:
                                                vm.addShape(.square)
                                            case .triangle:
                                                vm.addShape(.triangle)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .task {
                    await vm.loadButtons()
                }
        }
    }
}

#Preview {
    ShapeGridView()
}
