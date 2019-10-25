//
//  User.swift
//  game
//
//  Created by Eric on 2019/6/10.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import ObjectMapper

class User: NSObject, Mappable, NSCoding{
    
    var id: String!
    
    var nickname: String!
    
    var avatar: String!
    
    var intro: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        nickname <- map["nickname"]
        avatar <- map["avatar"]
        intro <- map["intro"]
    }
    
    init(id: String, nickname: String, avatar: String, intro: String) {
        self.id = id
        self.nickname = nickname
        self.avatar = avatar
        self.intro = intro
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObject(forKey: "id") as! String
        let nickname = aDecoder.decodeObject(forKey: "nickname") as! String
        let avatar = aDecoder.decodeObject(forKey: "avatar") as! String
        let intro = aDecoder.decodeObject(forKey: "intro") as! String
        self.init(id: id, nickname: nickname, avatar: avatar, intro: intro)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(nickname, forKey: "nickname")
        aCoder.encode(avatar, forKey: "avatar")
        aCoder.encode(intro, forKey: "intro")
    }
}
