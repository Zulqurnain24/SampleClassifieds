//
//  TestProductGalleryViewController.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 23/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestProductGalleryViewController: XCTestCase {
    
    var sut: ProductGalleryViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ProductGalleryViewController") as? ProductGalleryViewController
        sut.loadView()
        sut.viewDidLoad()
        sut.viewWillAppear(true)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testGeneralAlertView() {
       XCTAssertNotNil(sut)
       XCTAssertEqual(sut.productGalleryViewModel, ProductGalleryViewModel())
        XCTAssertEqual(sut.isLoading, false)
    }

}
