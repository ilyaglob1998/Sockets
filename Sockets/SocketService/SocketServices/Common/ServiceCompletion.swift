//
//  ServiceCompletion.swift
//  Sockets
//
//  Created by Mac on 15/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import Foundation

enum ServiceCompletion<T> {
    
    case dataResponse(T)
    case errorResponse(String?)
    
    var localizerDescription: String {
        switch self {
        case .errorResponse(let response):
            return response == nil ? "Ошибка в конвертации модели!" : ""
        default: return ""
        }
    }
}
