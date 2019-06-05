//
//  Strategy.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import ObjectMapper

class Strategy: Mappable{
    
    var id: String!

    var userId: String!

    var gameId: String!

    var title: String!

    var content: String!
    
    var summary: String!

    var cover: String!

    var origin: String!

    var from: String!
    
    var viewTotal: Int!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["userId"]
        gameId <- map["gameId"]
        title <- map["title"]
        content <- map["content"]
        summary <- map["summary"]
        cover <- map["cover"]
        origin <- map["origin"]
        from <- map["from"]
        viewTotal <- map["viewTotal"]
    }
}
