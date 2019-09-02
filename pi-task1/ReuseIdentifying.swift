//
//  ReuseIdentifying.swift
//  pi-task1
//
//  Created by Kirill on 9/1/19.
//  Copyright © 2019 Kirill. All rights reserved.
//

import Foundation

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
