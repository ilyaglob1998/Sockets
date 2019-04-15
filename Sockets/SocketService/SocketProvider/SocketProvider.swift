//
//  SocketServise.swift
//  Sockets
//
//  Created by Mac on 14/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import Starscream
import ObjectMapper

enum ResponseSocket {
    
    case success
    case failure
}

class SocketProvider {
    
    #if (DEBUG)
    private let urlString = "http://52.43.123.104:8000/stream/client/?appId=sdhsdf8h87dsfh9sdfh87dsfh87sdfh"
    #else
    private let urlString = "http://localhost:9090/"
    #endif
    
    var _socket: WebSocket?
    var onTextCompletion: ((String) -> Void)? {
        get {
          return _socket?.onText
        }
        set {}
    }
    var onDisconnectCompletion: ((Error) -> Void)? {
        get {
            return _socket?.onDisconnect
        }
        set {}
    }
    
    required init() {
        createSocketsCommunication()
    }
    
    private func createSocketsCommunication() {
        guard let url = URL(string: urlString) else { return }
        _socket = WebSocket(url: url)
        clouserClient()
        _socket?.connect()
    }
    
    private func clouserClient() {
        _socket?.onConnect = {
            print("connect")
        }
    }
    
    private func write(_ json: [String: Any]) {
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        let dataString = String(bytes: jsonData, encoding: .utf8)
        _socket?.write(string: dataString ?? "")
    }
}

// Generate outputStream
extension SocketProvider {
    
    var checkConnection: Bool {
        return _socket?.isConnected ?? false
    }
    
    func sendData(targetData: [String: Any]) {
        write(targetData)
    }
}
