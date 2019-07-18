//
//  Contants.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit

struct Const {
    
    struct Colors {
        static let whiteBg = UIColor.white
    }
    
    struct URL {
        static let base = "https://venro.ru/api/"
        static let key = "e57250cb89543f922eb2da8688471bf0"
    }
    
    struct Fonts {
        static func regular(with size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
        
        static func bold(with size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
        
        static func medium(with size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .medium)
        }
        
        static func light(with size: CGFloat) -> UIFont {
            return UIFont.systemFont(ofSize: size, weight: .light)
        }
    }
    
    
}
