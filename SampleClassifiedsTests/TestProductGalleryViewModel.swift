//
//  TestProductGalleryViewModel.swift
//  SampleClassifiedsTests
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit
import XCTest
@testable import SampleClassifieds

class TestProductGalleryViewModel: XCTestCase {
    
    var sut: ProductGalleryViewModel!
    
    override func setUp() {
        super.setUp()
        sut = ProductGalleryViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testProductGalleryViewModel() {
        let product1 = Product(uid: "01",
                               createdAt: "01-07-2021",
                               name: "watch",
                               price: "AED 10",
                               imageUrls: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"],
                               imageUrlThumbnails: ["https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTgrFPidOzbhn9VdiWBCK_rUZSM_cF-O-xlqdiq63pN4hHDFvtYjc7B1gPaHB-DtL56VDHdQg19YADc-E2a2qvEO7fLi81Zzr7-WqmLTLs&usqp=CAc"])
        let product2 = Product(uid: "02",
                               createdAt: "02-07-2021",
                               name: "Suit",
                               price: "AED 1000",
                               imageUrls: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyzQVV138952BQRi2fE5ZxONZGSZxCN92haQ&usqp=CAU"],
                               imageUrlThumbnails: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyzQVV138952BQRi2fE5ZxONZGSZxCN92haQ&usqp=CAU"])
        sut.productList = [product1, product2]
        XCTAssertEqual(sut.productList.first, product1)
        XCTAssertEqual(sut.productList.last, product2)
        
        sut.saveFiles()
        sut.productList.removeAll()
        sut.populateFilesFromPersistenceStorage()
        XCTAssertTrue(sut.productList.count > 0)
        XCTAssertEqual(sut.productList.first, product1)
        XCTAssertEqual(sut.productList.last, product2)

    }

}
