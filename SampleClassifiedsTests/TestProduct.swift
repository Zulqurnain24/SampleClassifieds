//
//  TestProduct.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestProduct: XCTestCase {
    
    var sut: Product!
    
    override func setUp() {
        super.setUp()
        sut = Product(uid: "01",
                      createdAt: "01-07-2021",
                      name: "watch",
                      price: "AED 10",
                      imageUrls: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"],
                      imageUrlThumbnails: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"])
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testProduct() {
        let product = Product(uid: "01",
                              createdAt: "01-07-2021",
                              name: "watch",
                              price: "AED 10",
                              imageUrls: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"],
                              imageUrlThumbnails: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"])
        XCTAssertEqual(product, sut)
    }
}
