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
                    ForEach(itemScreenViewModel.items) { item in
                        NavigationLink {
                            Text("Item at \(item.author)")
                        } label: {
                            Text(item.author)
                        }
                    }
                }
            }
            .navigationTitle("Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        print("pressed")
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
}


#Preview {
    ItemScreen()
}
