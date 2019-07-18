//
//  GlobalFunctions.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import Foundation
import AlamofireDomain

let sessionManager = GlobalFunctions.defaultSessionManager()

struct GlobalFunctions {
    
    static func defaultSessionManager() -> SessionManager {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        let manager = AlamofireDomain.SessionManager(configuration: configuration)
        return manager
    }
}
