//
//  ItemResponseDTO.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

public struct ItemResponseDTO: Decodable, Identifiable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadUrl = "download_url"
    }
}
