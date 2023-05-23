//
//  YapeRecipesAppUITests.swift
//  YapeRecipesAppUITests
//
//  Created by Nelida Valencia on 16/05/23.
//

import XCTest

final class YapeRecipesAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let cell = app.tables.staticTexts.matching(identifier: "titleRecipe").firstMatch
        let _ = cell.waitForExistence(timeout: 5)
        cell.tap()
        
        app.staticTexts["Ir a mapa"].tap()
        app.buttons["backMap"].tap()
        app.buttons["backRecipe"].tap()
    }
}
