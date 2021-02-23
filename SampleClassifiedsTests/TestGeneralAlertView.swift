//
//  TestGeneralAlertView.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 23/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestGeneralAlertView: XCTestCase {
    
    var sut: GeneralAlertView!
    
    override func setUp() {
        super.setUp()
        sut = GeneralAlertView()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGeneralAlertView() {
       XCTAssertNotNil(sut)
       XCTAssertNotNil(sut.promptDescriptionLabel)
       XCTAssertNotNil(sut.promptTitleLabel)
       XCTAssertNotNil(sut.submitButton)
        sut.submitButtonCallback = {
            
        }
       XCTAssertNotNil(sut.submitButtonCallback)
        sut.promptDescriptionLabel.text = "Please restore internet connection"
        XCTAssertEqual(sut.promptDescriptionLabel.text, "Please restore internet connection")
      sut.promptTitleLabel.text = "Error"
      XCTAssertEqual(sut.promptTitleLabel.text, "Error")
    }

}
