//
//  Rick_And_Morty_InfoUITestsLaunchTests.swift
//  Rick And Morty InfoUITests
//
//  Created by Oscar Andrés  Rodas Montoya on 30/5/23.
//

import XCTest

final class Rick_And_Morty_InfoUITestsLaunchTests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testSearchCharacters() {
        
            let app = XCUIApplication()
            
       
            let searchField = app.textFields["Buscar"]
            searchField.tap()
            searchField.typeText("Morty")
            
            let firstCell = app.tables.cells.element(boundBy: 0)
            XCTAssertTrue(firstCell.waitForExistence(timeout: 5))
            XCTAssertEqual(firstCell.staticTexts.element.label, "Morty Smith")
        }
    }
