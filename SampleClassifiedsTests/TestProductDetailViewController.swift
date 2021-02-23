//
//  TestProductDetailViewController.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 23/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestProductDetailViewController: XCTestCase {
    
    var sut: ProductDetailViewController!
    var mockProduct = Product(uid: "01",
                          createdAt: "01-07-2021",
                          name: "watch",
                          price: "AED 10",
                          imageUrls: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"],
                          imageUrlThumbnails: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"])
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
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
        sut.productImageView.image = #imageLiteral(resourceName: "dubizzle")
        XCTAssertEqual(sut.productImageView.image, #imageLiteral(resourceName: "dubizzle"))
        sut.productTitleLabel.text = "Tie"
        XCTAssertEqual(sut.productTitleLabel.text, "Tie")
        sut.productPriceLabel.text = "AED 23"
        XCTAssertEqual(sut.productPriceLabel.text, "AED 23")
        sut.productId.text = "111"
        XCTAssertEqual(sut.productId.text, "111")
        XCTAssertEqual(sut.productDetailViewModel, ProductDetailViewModel())
        sut.productDetailViewModel.product = mockProduct
        XCTAssertEqual( sut.productDetailViewModel.product, mockProduct)
    }

}
