//
//  UITableViewCell + Extension.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func removeSectionSeparators() {
        for subview in subviews {
            if subview != contentView && subview.frame.width == frame.width {
                subview.removeFromSuperview()
            }
        }
    }
    
    func removeMargins() {
        if self.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
            self.separatorInset = UIEdgeInsets.zero
        }
        
        if self.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)) {
            self.preservesSuperviewLayoutMargins = false
        }
        
        if self.responds(to: #selector(setter: UIView.layoutMargins)) {
            self.layoutMargins = UIEdgeInsets.zero
        }
    }   
}
