//
//  ProductDetailViewModel.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import Foundation

class ProductDetailViewModel {
    var completionHandler: ((Product) -> Void)? = nil
    
    var product: Product? {
        didSet {
            guard let product = self.product else { return }
            completionHandler?(product)
        }
    }
}

extension ProductDetailViewModel: Equatable {
    static func == (lhs: ProductDetailViewModel, rhs: ProductDetailViewModel) -> Bool {
        return  lhs.product == rhs.product
    }
}
