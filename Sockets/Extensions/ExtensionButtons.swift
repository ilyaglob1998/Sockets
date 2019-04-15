//
//  ExtensionButtons.swift
//  Sockets
//
//  Created by Mac on 14/04/2019.
//  Copyright © 2019 Ilya Razumov. All rights reserved.
//

import UIKit

class ButtonWithCompletion: UIButton {
    
    var tapCompletion: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self,
                       action: #selector(callClouser),
                       for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self,
                       action: #selector(callClouser),
                       for: .touchUpInside)
    }
    
    @objc
    private func callClouser() {
        tapCompletion?()
    }
}
