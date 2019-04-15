//
//  RegistrationService.swift
//  Sockets
//
//  Created by Mac on 15/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import Foundation

class RegistrationService: SocketDelegate {
    
    internal var _socketProvider: SocketProvider?
    
    init() {
        _socketProvider = SocketProvider()
    }
    
    func sendMessageWithText(text: String, completion: @escaping ((String) -> ())) {
        guard let socketProvider = _socketProvider else { return }
        socketProvider.sendData(targetData: AnyTarget.create(email: text).dataCase)
        socketProvider._socket?.onText = { text in
            completion(text)
        }
    }
}
