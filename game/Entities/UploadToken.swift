//
//  UploadToken.swift
//  game
//
//  Created by Eric on 31/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

class UploadToken: Mappable{
    
    var token: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        token <- map["token"]
    }
}
