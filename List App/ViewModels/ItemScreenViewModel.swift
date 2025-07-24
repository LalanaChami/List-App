//
//  ItemScreenViewModel.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import CoreData
import Foundation
import Combine

class ItemScreenViewModel : ObservableObject {
    let container : NSPersistentContainer
    private var cancellables = Set<AnyCancellable>()
    @Published var items : [ItemResponseDTO] = []
    @Published var savedItems : [ItemEntity] = []
    private var itemUsecase: ItemUsecase = ItemUsecase(itemRepository: ItemRepository())
    
    init() {
        container = NSPersistentContainer(name: "List_App")
        loadInitialData()
        container.loadPersistentStores { (description , error) in
            if (error as NSError?) != nil {
                print("Error in loading List app DB")
            } else {
                print(" List app DB loaded")
            }
            self.fetchSavedItems()
        }
        
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
    
    func fetchSavedItems() {
        let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        do {
            savedItems = try container.viewContext.fetch(request)
        } catch let error {
            print("Error in fetching ItemEntity data , \(error)")
        }
    }
    
    func addRandomNewItem() {
        let newItem = ItemEntity(context: container.viewContext)
        let savedItemIDList = Set(savedItems.map { $0.id })
        let unsavedItems = items.filter { !savedItemIDList.contains($0.id) }
        
        guard let randomItem = unsavedItems.randomElement() else {
            print("All items are saved in db")
            return
        }
        

        newItem.id = randomItem.id
        newItem.author = randomItem.author
        newItem.width = Int16(randomItem.width)
        newItem.height = Int16(randomItem.height)
        newItem.url = randomItem.url
        newItem.downloadUrl = randomItem.downloadUrl
        saveAddedItem()
    }
    
    func saveAddedItem() {
        do {
            try container.viewContext.save()
            fetchSavedItems()
        } catch let error {
            print("Couldnt save the Item entity: \(error)")
        }
    }
}
