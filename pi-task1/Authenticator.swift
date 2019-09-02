//
//  Authenticator.swift
//  pi-task1
//
//  Created by Kirill on 9/2/19.
//  Copyright © 2019 Kirill. All rights reserved.
//

import Foundation
import FlickrKit

class Authenticator {
    static let shared = Authenticator()
    
    private init() { }
    
    func initialize(key: String, secret: String) {
        FlickrKit.shared().initialize(withAPIKey: key, sharedSecret: secret)
    }
}
