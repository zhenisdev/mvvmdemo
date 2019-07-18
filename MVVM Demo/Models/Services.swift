//
//  Services.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import SwiftyJSON

class Services {
    var id: String?
    var name: String?
    var description: String?
    var cost: String?
    var min: String?
    var max: String?
    
    init() {}
    
    init(json: JSON) {
        self.id = json["ID"].stringValue
        self.name = json["name"].stringValue
        self.description = json["description"].stringValue
        self.cost = json["cost"].stringValue
        self.min = json["min"].stringValue
        self.max = json["max"].stringValue
    }
}
