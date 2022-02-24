//
//  Session.swift
//  VK
//
//  Created by Дмитрий Супрун on 24.02.22.
//

import Foundation

class Session {
    class Session {
        
        static let instance = Session()
        
        private init() {}

        var token:String = ""
        var userId: Int = 0
    }
}
