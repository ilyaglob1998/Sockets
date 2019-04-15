//
//  RegistrationService.swift
//  Sockets
//
//  Created by Mac on 15/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import Foundation
import ObjectMapper

class RegistrationService: SocketDelegate {
    
    internal var _socketProvider: SocketProvider?
    
    init() { _socketProvider = SocketProvider() }
    
    func sendMessageWithText(text: String, completion: @escaping ((ServiceCompletion<SimpleModel>) -> ())) {
        guard let socketProvider = _socketProvider else { return }
        socketProvider.sendMessage(JSON: ["hey":"hey"]) { (response) in
            switch response {
            case .success(let string):
                guard let data = Mapper<SimpleModel>().map(JSONString: string) else {
                    return completion(.errorResponse(nil))
                }
                return completion(.dataResponse(data))
            case .failure(let errorLocalized):
                return completion(.errorResponse(errorLocalized?.localizedDescription))
            }
        }
    }
}
