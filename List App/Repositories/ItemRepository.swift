//
//  ItemRepository.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//
import Combine
import Foundation

protocol ItemRepositoryProtocol {
    func getItemList() -> AnyPublisher<[ItemResponseDTO], Error>
}

public class ItemRepository: ItemRepositoryProtocol {
    private let session: URLSession = .shared
    private let configManager = ConfigManager(configName: "ReqConfig")
    
    
    public func getItemList() -> AnyPublisher<[ItemResponseDTO], any Error> {
        let imageListReqURL = configManager.itemListURL()
        
        return session.dataTaskPublisher(for: imageListReqURL)
            .tryMap { [weak self] data, response in
                try CommonHelpers.shared.handleResponse(data: data, response: response)
            }
            .decode(type: [ItemResponseDTO].self, decoder: JSONDecoder())
            .mapError { error in
                CommonHelpers.shared.mapError(error)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    
    
}

