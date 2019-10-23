//
//  String+Extension.swift
//  game
//
//  Created by Eric on 14/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

//let regex = "(src=http[^\s]\b);"

//(http[^\s]+(jpg|jpeg|png|tiff)\b)


let regex = "src=['\"]([^\"]*)['\"]?";

extension String {

    public func matchesForRegex(regex: String) -> [String]? {
        do {
            let regularExpression = try NSRegularExpression(pattern: regex, options: [])
            let range = NSMakeRange(0, self.count)
            let results = regularExpression.matches(in: self, options: [], range: range)
            let string = self as NSString
            return results.map { string.substring(with: $0.range)}
        } catch {
            return nil
        }
    }
    
//    public func getImages() -> [String]?{
//        return matchesForRegex(regex: regex)
//    }
}
