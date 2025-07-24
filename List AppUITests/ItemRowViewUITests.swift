//
//  ItemRowViewUITests.swift
//  List AppUITests
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import XCTest

class ItemRowViewUITests: XCTestCase {
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
    
    func testDisplaysAuthorAndID() {
        // TODO: Test that the view displays the author and ID
    }
    
    func testImageLoadsAndPlaceholderAppears() {
        // TODO: Test that the image loads and placeholder appears as expected
    }
} 
