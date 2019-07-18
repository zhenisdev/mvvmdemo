//
//  UserDefaults + Extension.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import Foundation

let userDefaults = UserDefaults.standard

extension UserDefaults {
    
    enum UserDefaultsKeys: String {
        case isLoggedIn
        case isFirstLaunched
        case token
        case authVerificationID
    }
    
    func setIsFirstLaunched(value: Bool) {
        setValue(value, forKey: UserDefaultsKeys.isFirstLaunched.rawValue)
    }
    
    func isFirstLaunched() -> Bool {
        return bool(forKey: UserDefaultsKeys.isFirstLaunched.rawValue)
    }
    
    func setIsLoggedIn(value: Bool) {
        setValue(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func isLoggedIn() -> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func setAccessToken(value: String) {
        setValue(value, forKey: UserDefaultsKeys.token.rawValue)
    }
    
    func getAccessToken() -> String {
        return string(forKey: UserDefaultsKeys.token.rawValue)!
    }
    
    func removeAccessToken() {
        removeObject(forKey: UserDefaultsKeys.token.rawValue)
    }
    
    func setAuthVerificationID(value: String) {
        setValue(value, forKey: UserDefaultsKeys.authVerificationID.rawValue)
    }
    
    func getAuthVerificationID() -> String {
        return string(forKey: UserDefaultsKeys.authVerificationID.rawValue)!
    }
}

