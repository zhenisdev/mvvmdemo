//
//  String + Extension.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit
import Foundation

extension String {
    
    static let phoneFormat = "{+7} ([000]) [000] [00] [00]"
    
    func getImage() -> UIImage? {
        return UIImage(named: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func getRealPhoneNumber() -> String {
        var realPhone = self.replacingOccurrences(of: " ", with: "")
        realPhone = realPhone.replacingOccurrences(of: "+", with: "")
        realPhone = realPhone.replacingOccurrences(of: "(", with: "")
        realPhone = realPhone.replacingOccurrences(of: ")", with: "")
        return realPhone
    }

}
