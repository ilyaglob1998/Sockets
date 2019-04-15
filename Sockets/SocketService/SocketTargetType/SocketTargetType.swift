//
//  SocketTargetType.swift
//  Sockets
//
//  Created by Mac on 14/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import Foundation

typealias BaseData = [String: Any]

protocol SocketTargetType {
    
    var dataCase: BaseData { get }
}
