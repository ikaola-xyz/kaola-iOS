//
//  ApiUtils.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

let HOST_NAME : String = "http://api.dev.ikaola.xyz/"

//let HOST_NAME : String = "http://172.27.111.26:8080/"

class ApiUtils{
    
    class func buildUrl(_ action: String) -> String {
        return String(format: "%@%@", HOST_NAME, action)
    }
    
    class func buildUrl(_ action: String, param1: String) -> String {
        return String(format: "%@%@/%@", HOST_NAME, action, param1)
    }
    
    class func users() -> String {
        return buildUrl("users")
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
    
    class func tokens() -> String {
         return buildUrl("tokens")
    }
    
    class func uploadToken() -> String {
        return buildUrl("upload/token")
    }
}
