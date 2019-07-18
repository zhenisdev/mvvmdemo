//
//  BaseViewModel.swift
//  MVVM Demo
//
//  Created by Zhenis Mutan on 05.04.2018.
//  Copyright © 2018 Zhenis Mutan. All rights reserved.
//

import RxSwift
import RxCocoa
import AlamofireDomain
import SwiftyJSON

public enum RxRequestError: Error {
    case unknown
    /// Response is not successful. (not in `200 ..< 300` range)
    case httpRequestFailed(response: HTTPURLResponse, statusCode: Int)
    /// Deserialization error.
    case deserializationError(responceValue: Any?)
    
    public var debugDescription: String {
        switch self {
        case .unknown:
            return "Ошибка интернет соединения."
        case let .httpRequestFailed(_, statusCode):
            switch statusCode {
            case 409: return "Пользователь с таким номером уже существует"
            case 400: return "Неверный логин или пароль"
            case 420: return "Сессия окончена. Зайдите заново"
            case 500: return "Сервер не отвечает. Зайдите позже"
            default: return "Ошибка HTTP запроса с кодом `\(statusCode)`."
            }
        case let .deserializationError(responceValue):
            return "Ошибка во время сериализации: \(String(describing: responceValue))"
        }
    }
}

class BaseViewModel {
    
    init() {}
    
    public func loadJSON(url: URLConvertible, method: HTTPMethod = .get, parametres: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<[String: Any]> {
        return self.loadAny(url: url, method: method, parameters: parametres, encoding: encoding, headers: headers)
            .map({ any -> [String: Any] in
                guard let dict = any as? [String: Any] else {
                    throw RxRequestError.deserializationError(responceValue: any)
                }
                
                return dict
            })
    }
    
    public func loadAny(url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<Any> {
        return Observable<Any>.create { (observer) -> Disposable in
            let task = sessionManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate()
            
            task.responseJSON(queue: DispatchQueue.main, completionHandler: { serverResponce in
                guard let value = serverResponce.result.value else {
                    guard let responce = serverResponce.response else {
                        observer.onError(RxRequestError.unknown)
                        return
                    }
                    
                    let error = RxRequestError.httpRequestFailed(response: responce, statusCode: responce.statusCode)
                    observer.onError(error)
                    return
                }
                
                observer.onNext(value)
                observer.onCompleted()
            })
            
            task.resume()
            return Disposables.create(with: task.cancel)
        }
    }
    
    public func request(url: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<Any> {
        return Observable<Any>.create { (observer) -> Disposable in
            let task = sessionManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate()
            
            task.responseJSON(queue: DispatchQueue.main, completionHandler: { serverResponce in
                guard let _ = serverResponce.result.value else {
                    guard let responce = serverResponce.response else {
                        observer.onError(RxRequestError.unknown)
                        return
                    }
                    
                    let error = RxRequestError.httpRequestFailed(response: responce, statusCode: responce.statusCode)
                    observer.onError(error)
                    
                    return
                }
                
                observer.onNext(serverResponce)
                observer.onCompleted()
            })
            
            task.resume()
            return Disposables.create(with: task.cancel)
        }
    }
    
}
