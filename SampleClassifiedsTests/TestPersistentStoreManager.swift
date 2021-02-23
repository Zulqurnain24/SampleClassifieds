//
//  TestPersistentStoreManager.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestPersistentStoreManager: XCTestCase {
    
    var sut: PersistentStoreManager!
    
    override func setUp() {
        super.setUp()
        sut = PersistentStoreManager.shared
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testPersistentStorage() {
        let productList = [Product(uid: "01",
                                   createdAt: "01-07-2021",
                                   name: "watch",
                                   price: "AED 10",
                                   imageUrls: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"],
                                   imageUrlThumbnails: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"])]
        sut.setObject(uniqueId: StringConstants.products.rawValue, key: StringConstants.products.rawValue, value: productList)
        let storedProductList = PersistentStoreManager.shared.getObject(uniqueId: StringConstants.products.rawValue, StringConstants.products.rawValue, [Product].self)
        
        XCTAssertEqual(productList, storedProductList)
    }
}
