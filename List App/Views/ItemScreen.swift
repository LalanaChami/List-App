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
            VStack(alignment: .leading, spacing: 20) {
                List {
                    ForEach(itemScreenViewModel.savedItems) { item in
                        HStack {
                            if let imageUrl = item.downloadUrl, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                }
                            }
                            Text(item.author ?? "Unknown Author")
                        }
                    }
                    .onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            .navigationTitle("Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        itemScreenViewModel.addRandomNewItem()
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
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
