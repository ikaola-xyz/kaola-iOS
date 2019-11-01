//
//  UserModel.swift
//  game
//
//  Created by Eric on 1/11/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class UserModel{
    
    func updateAvatar(userId: String, avatar: String, success: @escaping ()->Void, error: @escaping (NSInteger)->Void){
        let url = ApiUtils.users() + "/"+userId + "/avatar"
        
        let parameters = [
            "avatar": avatar
        ]
                
        let headers: HTTPHeaders = [
                 "Authorization": LoginManager.getToken()
        ]
        
        AF.request(url, method: .put, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers, interceptor: nil)
            .validate()
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    success()
                    break
                case .failure(_):
                    print(response)
                    error(response.response!.statusCode)
                    break
                }
        }
    }
}
