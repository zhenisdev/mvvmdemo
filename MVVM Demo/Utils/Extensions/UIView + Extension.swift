//
//  UIView + Extension.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit
import Pastel

extension UIView {
    
    public func addGradient(firstColor: UIColor, secondColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.cornerRadius = self.layer.cornerRadius
        let colors = [secondColor.cgColor, firstColor.cgColor]
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func addAnimatedGradient(with colors: [UIColor], from start: PastelPoint, to end: PastelPoint, with duration: TimeInterval) {
        let pastelView = PastelView(frame: self.bounds)
        pastelView.startPastelPoint = start
        pastelView.endPastelPoint = end
        pastelView.animationDuration = duration
        pastelView.setColors(colors)
        pastelView.startAnimation()
        self.insertSubview(pastelView, at: 0)
    }
    
}
