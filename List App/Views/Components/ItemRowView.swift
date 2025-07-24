//
//  ItemRowView.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import SwiftUI

struct ItemRowView: View {
    let item: ItemEntity

    var body: some View {
        HStack(spacing: 15) {
            if let imageUrl = item.downloadUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(12)
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                        .background(Color.gray)
                        .cornerRadius(12)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.author ?? "Unknown Author")
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text("ID: \(item.id ?? "N/A")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        .listRowBackground(Color.white)
        .listRowSeparator(.hidden)
        .padding(.horizontal, 5)
    }
}

//#Preview {
//
//}
