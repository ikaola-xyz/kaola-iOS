//
//  ApiUtils.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

let HOST_NAME : String = "http://api.dev.ikaola.xyz/"

class ApiUtils{
    
    class func buildUrl(_ action: String) -> String {
        return String(format: "%@%@", HOST_NAME, action)
    }
    
    class func buildUrl(_ action: String, param1: String) -> String {
        return String(format: "%@%@/%@", HOST_NAME, action, param1)
    }
    
    class func strategies() -> String {
        return buildUrl("strategies")
    }
    
    class func strategies(id: String) -> String {
        return buildUrl("strategies", param1: id)
    }
    
    class func games() -> String {
        return buildUrl("games")
    }
    
    class func token() -> String {
         return buildUrl("token")
     }
}
