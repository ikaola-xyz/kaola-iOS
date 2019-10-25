//
//  UserDefaultsHelper.swift
//  game
//
//  Created by Eric on 25/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

class UserDefaultsHelper{
    
    class func remove(key: String){
        let defaults:UserDefaults = UserDefaults.standard
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    class func setObject(key: String, value: Any?) {
        let defaults:UserDefaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    class func objectForKey(key: String) -> Any? {
        let defaults:UserDefaults = UserDefaults.standard
        return defaults.object(forKey: key)
    }
    
    class func setString(key: String, value: String){
        setObject(key: key, value: value)
    }
    
    class func stringForKey(key: String) -> String {
        let defaults:UserDefaults = UserDefaults.standard
        let string = defaults.object(forKey: key) as? String
        return string ?? ""
    }
    
    class func setInteger(key: String, value: NSInteger){
        setObject(key: key, value: value)
    }
    
    class func setFloat(key: String, value: Float){
        setObject(key: key, value: value)
    }
    
    class func integerForKey(key: String) -> NSInteger {
        let defaults:UserDefaults = UserDefaults.standard
        return defaults.integer(forKey: key)
    }
    
    class func setBool(key: String, value: Bool) {
        setObject(key: key, value: value)
//        let defaults:UserDefaults = UserDefaults.standard
//        defaults.set(value, forKey: key)
//        defaults.synchronize()
    }
    
    class func boolForKey(key: String) -> Bool {
        let defaults:UserDefaults = UserDefaults.standard
        return defaults.bool(forKey: key)
    }
    
    class func floatForKey(key: String) -> Float {
        let defaults:UserDefaults = UserDefaults.standard
        return defaults.float(forKey: key)
    }
}
