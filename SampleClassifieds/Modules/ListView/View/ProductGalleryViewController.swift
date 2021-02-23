//
//  ProductGalleryViewController.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit

class ProductGalleryViewController: UICollectionViewController {
 
    var productGalleryViewModel = ProductGalleryViewModel()
    
    var selectedRow: Int?
    
    var isLoading = false
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        productGalleryViewModel.refreshCompletionHandler = {
            self.reloadContent()
        }
        
        HUDManager.addActivityIndicator(StringConstants.loadingProducts.rawValue, self)
        assignAccessibilityIdentifier()
        populateData()
        setupRefreshControl()
    }

    func assignAccessibilityIdentifier() {
        collectionView.accessibilityIdentifier = "CVAccessibilityIdentifier"
    }
    
    func reloadContent() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func setupRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
           refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
           collectionView.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        populateData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  let vc = segue.destination as? ProductDetailViewController,
            let selectdRow = self.selectedRow as Int?,
            selectdRow < productGalleryViewModel.productList.count {
            vc.productDetailViewModel.product = productGalleryViewModel.productList[selectdRow]
        }
    }
    
    func populateData() {
        productGalleryViewModel.fetchProductList {
            self.refreshControl.endRefreshing()
            HUDManager.removeHUD(self)
        } _: {
            self.refreshControl.endRefreshing()
            HUDManager.removeHUD(self)
            HUDManager.showGeneralAlert(viewController: self, title: "Error", message: "Please make sure you are connected with the internet and pull to refresh. Meanwhile data is loaded from the cache")
        }

    }
}

// MARK: - Collection view data source
extension ProductGalleryViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productGalleryViewModel.productList.count
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = indexPath.row

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVFullWidthCell.identifier, for: indexPath) as? ProductCVFullWidthCell
        cell?.product = productGalleryViewModel.productList[row]
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 376, height: 113)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "segueToDetailView", sender: self)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}
