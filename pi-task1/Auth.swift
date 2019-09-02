//
//  Auth.swift
//  pi-task1
//
//  Created by Kirill on 9/2/19.
//  Copyright © 2019 Kirill. All rights reserved.
//

import Foundation

protocol Auth {
    func initialize(key: String, secret: String)
}

extension Auth {
    func initialize(key: String, secret: String) {
        Authenticator.shared.initialize(key: key, secret: secret)
    }
}
