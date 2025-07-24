//
//  ItemUsecaseTests.swift
//  List AppTests
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import XCTest
@testable import List_App
import Combine

class ItemUsecaseTests: XCTestCase {
    var usecase: ItemUsecase!
    var mockRepository: MockItemRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockItemRepository()
        usecase = ItemUsecase(itemRepository: mockRepository)
    }
    
    override func tearDown() {
        usecase = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testGetItemListReturnsData() {
        // TODO: Test getItemList returns correct data
    }
    
    func testGetItemListHandlesError() {
        // TODO: Test getItemList handles repository error
    }
}

// MARK: - Mock
class MockItemRepository: ItemRepositoryProtocol {
    func getItemList() -> AnyPublisher<[ItemResponseDTO], Error> {
        // TODO: Implement mock
        fatalError("Not implemented")
    }
} 
