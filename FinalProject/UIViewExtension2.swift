//
//  UIViewExtension.swift
//  FinalProject
//
//  Created by Rabiga on 24.05.2023.
//

import Foundation
import UIKit

extension UIView{
    func loadViewFromNib(nibName: String)->UIView? {
        let bundle = Bundle(for:type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
//extension UIView {
//    class func fromNib<T: UIView>() -> T {
//        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
//    }
//}
