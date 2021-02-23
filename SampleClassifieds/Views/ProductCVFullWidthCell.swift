//
//  ProductCVFullWidthCell.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit
import Kingfisher

class ProductCVFullWidthCell: UICollectionViewCell {

    static let identifier = "ProductCVFullWidthCell"
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productId: UILabel!
    
    var product: Product? {
        didSet {
            guard let name =  self.product?.name else { return }
            self.productName.text = StringConstants.name.rawValue + name
            let url = URL(string: self.product?.imageUrlThumbnails?.first ?? "default")
            self.productImageView.kf.setImage(with: url)
            guard let price =  self.product?.price else { return }
            self.productPrice.text = StringConstants.price.rawValue + price
            guard let uid =  self.product?.uid else { return }
            self.productId.text = StringConstants.productId.rawValue + uid
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        isAccessibilityElement = true
    }
}
