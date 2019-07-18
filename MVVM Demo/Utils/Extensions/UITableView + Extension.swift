//
//  UITableView + Extension.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let cellId = String(describing: cellClass.self)
        register(cellClass.self, forCellReuseIdentifier: cellId)
    }
    
    func dequeueCell<T>(_ cellClass: T.Type, indexPath path: IndexPath) -> T {
        let cellId = String(describing: T.self)
        return self.dequeueReusableCell(withIdentifier: cellId, for: path) as! T
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ headerFooterClass: T.Type) {
        let id = String(describing: headerFooterClass.self)
        register(headerFooterClass.self, forHeaderFooterViewReuseIdentifier: id)
    }
    
    func dequeueHeaderFooter<T>(_ headerFooterClass: T.Type) -> T {
        let id = String(describing: T.self)
        return self.dequeueReusableHeaderFooterView(withIdentifier: id) as! T
    }
}
