//
//  ProductDetailViewController.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit

class ProductDetailViewController: BaseViewController {

    @IBOutlet weak var productImageView: UIImageView!

    @IBOutlet weak var productTitleLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var productId: UILabel!
    
    @IBOutlet weak var productDetailScrollview: UIScrollView!
    
    var productDetailViewModel = ProductDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productDetailViewModel.completionHandler = { product in
            DispatchQueue.main.async {
                let url = URL(string: self.productDetailViewModel.product?.imageUrls?.first ?? "default")
                self.productImageView.kf.setImage(with: url)
                
                guard let name = product.name else { return }
                self.productTitleLabel.text = StringConstants.name.rawValue + name
                
                guard let price = product.price else { return }
                self.productPriceLabel.text = StringConstants.price.rawValue + price
                
                guard let uid = product.uid else { return }
                self.productId.text = StringConstants.productId.rawValue + uid
            }
        }
        setAccessibilityIdentifier()
    }

    func setAccessibilityIdentifier() {
        productDetailScrollview.accessibilityIdentifier = "SVAccessibilityIdentifier"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let product = productDetailViewModel.product else { return }
        productDetailViewModel.completionHandler?(product)
    }
    
}
