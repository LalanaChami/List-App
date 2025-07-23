//
//  ItemUsecase.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import Combine

protocol ItemUsecaseProtocol {
    func getItemList() -> AnyPublisher<[ItemResponseDTO], Error>
}

public class ItemUsecase: ItemUsecaseProtocol {
    private var itemRepository: ItemRepositoryProtocol
    
    init(itemRepository: ItemRepositoryProtocol) {
        self.itemRepository = ItemRepository()
    }
    
    public func getItemList() -> AnyPublisher<[ItemResponseDTO], Error> {
        itemRepository.getItemList()
    }
}
