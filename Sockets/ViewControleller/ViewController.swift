//
//  ViewController.swift
//  Sockets
//
//  Created by Mac on 14/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sendButton: ButtonWithCompletion!
    var registrationService: RegistrationService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationService = RegistrationService()
        sendButton.tapCompletion = {
            self.registrationService?.sendMessageWithText(text: "Hi",
                                                          completion: { (text) in
                print(text)
            })
        }
    }
}

