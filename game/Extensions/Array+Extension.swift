//
//  Array+Extension.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import ObjectMapper

public extension Array where Element: BaseMappable{
    
    func map<T: Mappable>(array: [T]) -> String {
        return array.toJSONString() ?? ""
    }
}
