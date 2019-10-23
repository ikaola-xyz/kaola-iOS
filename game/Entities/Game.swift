//
//  Game.swift
//  game
//
//  Created by Eric on 16/9/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import ObjectMapper

class Game: Mappable{
    
    var id: String!
    
    var name: String!
    
    var logo: String!
    
    var cover: String!
    
    var description: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        logo <- map["logo"]
        cover <- map["cover"]
        description <- map["description"]
    }
}
