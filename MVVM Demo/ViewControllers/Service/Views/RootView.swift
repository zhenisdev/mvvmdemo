//
//  RootView.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit

class RootView: UIView {
    
    let loadingMaskView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        return view
    }()
    
    let loadingIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = UIColor.primary
        return aiv
    }()
    
    public var isLoadingViewHidden: Bool {
        set {
            if !newValue {
                self.showLoadingView()
            } else {
                self.hideLoadingView()
            }
        }
        
        get {
            return self.isLoadingViewHidden
        }
    }
    
    private func showLoadingView() {
        [loadingMaskView, loadingIndicator].forEach { (view) in
            addSubview(view)
        }
        
        loadingMaskView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        
        loadingIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        loadingIndicator.startAnimating()
    }
    
    private func hideLoadingView() {
        self.loadingMaskView.removeFromSuperview()
        self.loadingIndicator.removeFromSuperview()
    }
}
