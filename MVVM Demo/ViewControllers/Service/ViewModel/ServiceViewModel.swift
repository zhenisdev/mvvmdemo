//
//  ServiceViewModel.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import RxSwift
import RxCocoa
import SwiftyJSON
import AlamofireDomain

class ServiceViewModel: BaseViewModel {
    
    public func getServicesList() -> Observable<[Services]> {
        let URL = Const.URL.base + "orders?action=services&key=" + Const.URL.key
        
        return self.loadAny(url: URL, method: .get).map({ (result) -> [Services] in
            let json = JSON(result)
            let models = json.arrayValue.compactMap({ Services(json: $0) })
            return models
        })
    }
    
}
