//
//  ItemScreenViewModelTests.swift
//  List AppTests
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import XCTest
import Combine
import CoreData
@testable import List_App

class ItemScreenViewModelTests: XCTestCase {
    var viewModel: ItemScreenViewModel!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        viewModel = ItemScreenViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = []
        super.tearDown()
    }
    
    func testLoadInitialDataUpdatesItems() {
        let expectation = self.expectation(description: "Items loaded")
        viewModel.$items.dropFirst().sink { items in
            if !items.isEmpty {
                expectation.fulfill()
            }
        }.store(in: &cancellables)
        viewModel.loadInitialData()
        waitForExpectations(timeout: 2)
        XCTAssertFalse(viewModel.items.isEmpty)
    }
    
    func testLoadInitialDataHandlesError() {
        viewModel.loadInitialData()
        XCTAssertNotNil(viewModel.items)
    }
    
    func testFetchSavedItemsFetchesAndSorts() {
        let context = viewModel.container.viewContext
        let item = ItemEntity(context: context)
        item.id = "1"
        item.author = "Author"
        item.order = 1
        try? context.save()
        viewModel.fetchSavedItems()
        XCTAssertTrue(viewModel.savedItems.contains(where: { $0.id == "1" }))
    }
    
    func testAddRandomNewItemAddsItem() {
        let initialCount = viewModel.savedItems.count
        viewModel.items = [ItemResponseDTO(id: "2", author: "A", width: 1, height: 1, url: "", downloadUrl: "")]
        viewModel.addRandomNewItem()
        XCTAssertEqual(viewModel.savedItems.count, initialCount + 1)
    }
    
    func testAddRandomNewItemNoUnsavedItems() {
        let dto = ItemResponseDTO(id: "3", author: "B", width: 1, height: 1, url: "", downloadUrl: "")
        viewModel.items = [dto]
        let context = viewModel.container.viewContext
        let entity = ItemEntity(context: context)
        entity.id = "3"
        try? context.save()
        viewModel.fetchSavedItems()
        let initialCount = viewModel.savedItems.count
        viewModel.addRandomNewItem()
        XCTAssertEqual(viewModel.savedItems.count, initialCount)
    }
    
    func testSaveChangesPersistsData() {
        let context = viewModel.container.viewContext
        let item = ItemEntity(context: context)
        item.id = "4"
        item.author = "C"
        viewModel.saveChanges()
        viewModel.fetchSavedItems()
        XCTAssertTrue(viewModel.savedItems.contains(where: { $0.id == "4" }))
    }
    
    func testDeleteItemRemovesCorrectItem() {
        let context = viewModel.container.viewContext
        let item = ItemEntity(context: context)
        item.id = "5"
        try? context.save()
        viewModel.fetchSavedItems()
        let initialCount = viewModel.savedItems.count
        viewModel.deleteItem(at: IndexSet(integer: 0))
        XCTAssertEqual(viewModel.savedItems.count, initialCount - 1)
    }
    
    func testMoveItemReordersItems() {
        let context = viewModel.container.viewContext
        let item1 = ItemEntity(context: context)
        item1.id = "6"
        item1.order = 0
        let item2 = ItemEntity(context: context)
        item2.id = "7"
        item2.order = 1
        try? context.save()
        viewModel.fetchSavedItems()
        viewModel.moveItem(from: IndexSet(integer: 0), to: 1)
        XCTAssertEqual(viewModel.savedItems[1].id, "6")
    }
}
