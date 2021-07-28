//
//  UIAnimatable.swift
//  FinancialApp
//
//  Created by Timmy Van Cauwenberge on 7/21/21.
//

import Foundation
import MBProgressHUD

//protocol keeps code cleaner

protocol UIAnimatable where Self: UIViewController {
    func showLoadingAnimation()
    func hideLoadingAnimation()
}

extension UIAnimatable {
    
    func showLoadingAnimation() {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
    }
    
    func hideLoadingAnimation() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
