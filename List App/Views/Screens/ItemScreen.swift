//
//  ItemScreen.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import SwiftUI

public struct ItemScreen: View {
    @StateObject var itemScreenViewModel = ItemScreenViewModel()
    
    public var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1).ignoresSafeArea()
                
                VStack(spacing: 0) {
                    List {
                        ForEach(itemScreenViewModel.savedItems) { item in
                            ItemRowView(item: item)
                        }
                        .onDelete(perform: deleteItem)
                        .onMove(perform: moveItem)
                    }
                    .listStyle(.plain)
                }
            }
//            .navigationTitle("Item List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Item List")
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.accentColor)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        itemScreenViewModel.addRandomNewItem()
                    }) {
                        Label("Add Item", systemImage: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.green)
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.white.opacity(0.4), for: .navigationBar)
        }
    }

    private func deleteItem(at offsets: IndexSet) {
        itemScreenViewModel.deleteItem(at: offsets)
    }

    private func moveItem(from source: IndexSet, to destination: Int) {
        itemScreenViewModel.moveItem(from: source, to: destination)
    }
}

#Preview {
    ItemScreen()
}
