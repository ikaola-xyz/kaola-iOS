//
//  ApiUtils.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

let HOST_NAME : String = "http://47.92.140.191:8080/"

class ApiUtils{
    
    class func buildUrl(_ action: String) -> String {
        return String(format: "%@%@", HOST_NAME, action)
    }
    
    class func buildUrl(_ action: String, param1: String) -> String {
        return String(format: "%@%@/%@", HOST_NAME, action, param1)
    }
    
    class func strategy() -> String {
        return buildUrl("strategy")
    }
    
    class func strategy(id: String) -> String {
        return buildUrl("strategy", param1: id)
    }
}
