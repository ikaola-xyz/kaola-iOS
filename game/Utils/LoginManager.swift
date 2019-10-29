//
//  LoginManager.swift
//  game
//
//  Created by Eric on 25/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

let KEY_USER: String = "USER"

let KEY_TOKEN: String = "TOKEN"

class LoginManager{
    
    class func onLoginSucceeded(token: Token){
        UserDefaultsHelper.setString(key: KEY_TOKEN, value: token.token)
        let defaults:UserDefaults = UserDefaults.standard
        let encodeData: Data = NSKeyedArchiver.archivedData(withRootObject: token.user)
        defaults.set(encodeData, forKey: KEY_USER)
        defaults.synchronize()
    }
    
    class func getUser() -> User{
        let defaults: UserDefaults = UserDefaults.standard
        let decoded  = defaults.object(forKey: KEY_USER) as! Data
        let user = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
        return user
    }
    
    class func getToken() -> String{
        return UserDefaultsHelper.stringForKey(key: KEY_TOKEN)
    }
    
    class func isLogin() -> Bool{
        let defaults: UserDefaults = UserDefaults.standard
        return defaults.object(forKey: KEY_USER) != nil
    }
    
    class func logout(){
        UserDefaultsHelper.remove(key: KEY_TOKEN)
        UserDefaultsHelper.remove(key: KEY_USER)
    }
}
