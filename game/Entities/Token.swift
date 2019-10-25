//
//  Token.swift
//  game
//
//  Created by Eric on 24/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import ObjectMapper

class Token: Mappable{
    
    var user: User!
    
    var token: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        user <- map["user"]
    }
    
    
}
