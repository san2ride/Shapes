//
//  EditCirclesView.swift
//  ShapesApp
//
//  Created by Jason Sanchez on 7/6/25.
//

import SwiftUI

struct EditCirclesView: View {
    @ObservedObject var vm: ShapesGridViewModel
    
    var body: some View {
        VStack {
            ShapeView(gridShapes: vm.gridShapes.filter { $0.type == .circle })
                .padding()
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                HStack(spacing: 80) {
                    Button("Delete All") {
                        vm.deleteAllCircles()
                    }
                    Button("Add") {
                        vm.addShape(.circle)
                    }
                    Button("Remove") {
                        vm.removeLastCircle()
                    }
                }
            }
        }
    }
}

#Preview {
    EditCirclesView(vm: ShapesGridViewModel())
}
