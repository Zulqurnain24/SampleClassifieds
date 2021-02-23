//
//  SampleClassifiedsUITests.swift
//  SampleClassifiedsUITests
//
//  Created by Zulqurnain on 22/02/2021.
//

import XCTest

class SampleClassifiedsUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testListView() throws {
        let app = XCUIApplication()
        app.launch()
        let query = app.descendants(matching: .any)
        let collectionView = query["CVAccessibilityIdentifier"]
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        let targetCell = collectionView.cells.element(boundBy: 0)
        if targetCell.isHittable {
            targetCell.tap()
        }
    }
    
    func testDetailView() throws {
        let app = XCUIApplication()
        app.launch()
        let query = app.descendants(matching: .any)
        let collectionView = query["CVAccessibilityIdentifier"]
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        let targetCell = collectionView.cells.element(boundBy: 0)
        if targetCell.isHittable {
            targetCell.tap()
            let scrollView = query["SVAccessibilityIdentifier"]
            scrollView.swipeUp()
        }

    }
}
