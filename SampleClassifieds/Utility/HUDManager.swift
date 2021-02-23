//
//  HUDManager.swift
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

import UIKit

protocol HUDManagerProtocol: class {
    static func addActivityIndicator(_ title: String, _ viewController: UIViewController)
    static func removeHUD(_ viewController: UIViewController)
    static func showGeneralAlert(viewController: UIViewController, title: String, message: String, okCallback: (()->Void)?, cancelCallback: (()->Void)?)
}

/* CommonFunctionality
 This contains the miscellaneous functionalities like presenting Alert and resizing the image
 */
final class HUDManager: HUDManagerProtocol {

    static func addActivityIndicator(_ title: String, _ viewController: UIViewController) {
        
        DispatchQueue.main.async {
            let fancyLoaderFrame = CGRect(origin: viewController.view.center, size: CGSize(width: 0.35 * viewController.view.frame.size.width, height: 0.26 * viewController.view.frame.size.height))
            
            let fancyLoaderView:FancyLoaderView = FancyLoaderView(frame: fancyLoaderFrame)
            fancyLoaderView.center = viewController.view.center
            fancyLoaderView.center.y = fancyLoaderView.center.y - 100
            fancyLoaderView.titleLabelText = title
            
            fancyLoaderView.startAnimating()
            
            viewController.view.bringSubviewToFront(fancyLoaderView)
            viewController.view.addSubview(fancyLoaderView)
        }
    }

    static func removeHUD(_ viewController: UIViewController) {
        DispatchQueue.main.async {
            viewController.view.subviews.filter({$0 is FancyLoaderView || $0 is GeneralAlertView}).forEach({ view in
                view.removeFromSuperview()
            })
        }
    }
   
    static func showGeneralAlert(viewController: UIViewController, title: String, message: String, okCallback: (()->Void)? = nil, cancelCallback: (()->Void)? = nil)
    {
        DispatchQueue.main.async {
            let generalAlertViewFrame = CGRect(origin: viewController.view.frame.origin, size: CGSize(width: viewController.view.frame.size.width, height: 0.25 * viewController.view.frame.size.height))
            
            let generalAlertViewView:GeneralAlertView =  GeneralAlertView(frame: generalAlertViewFrame)
            generalAlertViewView.promptTitleLabel.text = title
            generalAlertViewView.promptDescriptionLabel.text = message
            generalAlertViewView.submitButtonCallback = okCallback
            generalAlertViewView.center = CGPoint(x: viewController.view.center.x, y: viewController.view.center.y - generalAlertViewView.frame.height)
     
           viewController.view.addSubview(generalAlertViewView)
        }
    }
}



