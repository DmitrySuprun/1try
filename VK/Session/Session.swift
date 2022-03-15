//
//  Session.swift
//  VK
//
//  Created by Дмитрий Супрун on 24.02.22.
//

import Foundation


class SessionVK {
    
    static let instance = SessionVK()
    
    private init() {}
    
    var token: String = ""
    var userId: Int = 0
}
