//
//  ItemScreenUITests.swift
//  List AppUITests
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import XCTest

class ItemScreenUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testListDisplaysSavedItems() {
        // TODO: Test that the list displays saved items
    }
    
    func testAddNewItem() {
        // TODO: Test adding a new item via the + button
    }
    
    func testDeleteItem() {
        // TODO: Test deleting an item via swipe-to-delete
    }
    
    func testReorderItems() {
        // TODO: Test reordering items via drag-and-drop
    }
    
    func testNavigationBarDisplaysCorrectly() {
        // TODO: Test navigation bar title and buttons
    }
} 
