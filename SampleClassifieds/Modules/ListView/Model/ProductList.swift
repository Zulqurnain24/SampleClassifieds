//
//  ProductList.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit

struct ProductList: Codable {
    var results: [Product]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([Product].self, forKey: .results)
    }
}

extension ProductList: Equatable {
    static func == (lhs: ProductList, rhs: ProductList) -> Bool {
        return lhs.results == rhs.results
    }
}

