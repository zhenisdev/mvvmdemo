//
//  UIViewController + Extension.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import UIKit
import Material

extension UIViewController {
    
    public func getView<R>() -> R? {
        if #available(iOS 9.0, *) {
            return self.viewIfLoaded.flatMap { $0 as? R }
        } else {
            return self.isViewLoaded ? self as? R : nil
        }
    }
    
    typealias CancelAction = (_ sender: UIAlertAction) -> ()
    func presentAlert(title: String, message: String?, actionTitle: String = "ОК", action: @escaping CancelAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: actionTitle, style: .default) { (sender) in
            action(sender)
        }
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    public func presentErrorController(title: String = "Ошибка", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ОК", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    typealias RepeatAction = (_ sender: UIAlertAction) -> ()
    func presentRepeatErrorController(title: String = "Ошибка", error: Error, titleForAction: String = "Повторить", action: @escaping RepeatAction) {
        var message = ""
        if let RXError = error as? RxRequestError {
            message = RXError.debugDescription
        } else {
            message = error.localizedDescription
        }
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let defaultAction = UIAlertAction(title: titleForAction, style: .default) { (sender) in
            action(sender)
        }
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

