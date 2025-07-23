//
//  ItemScreenViewModel.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import Foundation
import Combine

class ItemScreenViewModel : ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var items : [ItemResponseDTO] = []
    private var itemUsecase: ItemUsecase = ItemUsecase(itemRepository: ItemRepository())
    
    init() {
        loadInitialData()
    }
    
    func loadInitialData() {
        itemUsecase.getItemList()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Insertion into context successful")
                case let .failure(error):
                    print(error)
                }
            }, receiveValue: { [self] responseData in
                print(responseData)
                items = responseData
            })
            .store(in: &cancellables)
    }
    
}
