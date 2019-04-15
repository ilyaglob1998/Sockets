//
//  Model.swift
//  Sockets
//
//  Created by Mac on 14/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import ObjectMapper

class SimpleModel: Mappable {
    
    var message: String = ""
    var command: String? = ""
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        message <- map["msg"]
        command <- map["command"]
    }
}
