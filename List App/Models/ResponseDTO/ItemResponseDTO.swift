//
//  ItemResponseDTO.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

public struct ItemResponseDTO: Decodable, Identifiable {
    public let id: String
    public let author: String
    public let width: Int
    public let height: Int
    public let url: String
    public let downloadUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadUrl = "download_url"
    }
}
