//
//  AnyTarget.swift
//  Sockets
//
//  Created by Mac on 14/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import Foundation

enum AnyTarget: SocketTargetType {
    
    case create(email: String)
    case getInfo(dict: BaseData)
    
    var dataCase: BaseData  {
        switch self {
        case .create(let email):
            return ["registration": email]
        case .getInfo(let dict):
            return dict
        }
    }
}
