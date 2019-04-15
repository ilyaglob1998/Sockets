//
//  SocketDelegateProtocol.swift
//  Sockets
//
//  Created by Mac on 15/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import Foundation

// Implementation for which service
protocol SocketDelegate {
    
    var _socketProvider: SocketProvider? { get set }
}
