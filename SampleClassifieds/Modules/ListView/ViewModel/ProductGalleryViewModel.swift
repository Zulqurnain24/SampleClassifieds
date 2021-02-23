//
//  ProductGalleryViewModel.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import Foundation

class ProductGalleryViewModel {
    private let webserviceManager = WebserviceManager()
    var productList = [Product]() {
        didSet {
            guard productList.count > 0 else { return }
            saveFiles()
            refreshCompletionHandler?()
        }
    }
    
    var refreshCompletionHandler: (() -> Void)? = nil

    func saveFiles() {
        PersistentStoreManager.shared.setObject(uniqueId: StringConstants.products.rawValue, key: StringConstants.products.rawValue, value: productList)
    }
    
    func populateFilesFromPersistenceStorage() {
        guard let savedFileList = PersistentStoreManager.shared.getObject(uniqueId: StringConstants.products.rawValue, StringConstants.products.rawValue, [Product].self)
        else { return }

        self.productList = savedFileList
    }
    
    func populateDataFromPersistenceStorage() {
        self.populateFilesFromPersistenceStorage()
        self.refreshCompletionHandler?()
    }
    
    func fetchProductList(_ successCompletionHandler:(() -> Void)? = nil,
                          _ failureCompletionHandler:(() -> Void)? = nil) {
        webserviceManager.callProductsListService({ productList in
            successCompletionHandler?()
            self.productList = productList?.results ?? []
            self.refreshCompletionHandler?()
        }, { error in
            failureCompletionHandler?()
            self.populateDataFromPersistenceStorage()
        })
    }
}

extension ProductGalleryViewModel: Equatable {
    static func == (lhs: ProductGalleryViewModel, rhs: ProductGalleryViewModel) -> Bool {
        return  lhs.productList == rhs.productList
    }
}
