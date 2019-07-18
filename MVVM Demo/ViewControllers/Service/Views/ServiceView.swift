//
//  ServiceView.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit
import SnapKit

class ServiceView: RootView {
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorInset = .zero
        tv.estimatedRowHeight = 44
        tv.rowHeight = UITableView.automaticDimension
        tv.tableFooterView = UIView()
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
}
