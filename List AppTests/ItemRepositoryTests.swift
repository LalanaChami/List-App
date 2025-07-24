//
//  ItemRepositoryTests.swift
//  List AppTests
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import XCTest
@testable import List_App

class ItemRepositoryTests: XCTestCase {
    var repository: ItemRepository!

    override func setUp() {
        super.setUp()
        repository = ItemRepository()
    }

    override func tearDown() {
        repository = nil
        super.tearDown()
    }

    func testGetItemListCallsCorrectURL() {
        // TODO: Test getItemList calls correct URL
    }

    func testGetItemListDecodesData() {
        // TODO: Test getItemList decodes data correctly
    }

    func testGetItemListMapsErrors() {
        // TODO: Test getItemList maps errors using CommonHelpers
    }
}
