//
//  User.swift
//  game
//
//  Created by Eric on 2019/6/10.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable{
    
    var id: String!
    
    var nickname: String!
    
    var avatar: String!
    
    var intro: String!
    
    var created: Double!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        nickname <- map["nickname"]
        avatar <- map["avatar"]
        intro <- map["intro"]
        created <- map["created"]
    }
}
