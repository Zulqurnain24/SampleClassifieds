//
//  Product.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit

struct Product: Codable {
    var uid: String?
    var createdAt: String?
    var name: String?
    var price: String?
    var imageUrls: [String]?
    var imageUrlThumbnails: [String]?
    
    enum CodingKeys: String, CodingKey {
        case uid = "uid"
        case createdAt = "created_at"
        case name = "name"
        case imageUrls = "image_urls"
        case price = "price"
        case imageUrlThumbnails = "image_urls_thumbnails"
    }
    init(uid: String?,
         createdAt: String?,
         name: String?,
         price: String?,
         imageUrls: [String]?,
         imageUrlThumbnails: [String]?) {
        self.uid = uid
        self.createdAt = createdAt
        self.name = name
        self.price = price
        self.imageUrls = imageUrls
        self.imageUrlThumbnails = imageUrlThumbnails
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uid = try values.decodeIfPresent(String.self, forKey: .uid)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        imageUrls = try values.decodeIfPresent([String].self, forKey: .imageUrls)
        imageUrlThumbnails = try values.decodeIfPresent([String].self, forKey: .imageUrls)
    }
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return  lhs.uid == rhs.uid
                &&
                lhs.createdAt == rhs.createdAt
                &&
                lhs.name == rhs.name
                &&
                lhs.imageUrls == rhs.imageUrls
                &&
                lhs.imageUrlThumbnails == rhs.imageUrlThumbnails
    }
}
