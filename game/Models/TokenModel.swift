//
//  TokenModel.swift
//  game
//
//  Created by Eric on 24/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class TokenModel{
    
    func post(email: String, password: String, success: @escaping (Token)->Void, error: @escaping ()->Void){
        let parameters = [
            "username": email,
            "password": password
        ]
        
        let url = ApiUtils.tokens()
        AF.request(url,
                   method: .post,
                   parameters: parameters,
                   encoder: JSONParameterEncoder.default)
            .validate()
            .responseJSON { (response) in
                switch response.result{
                case .success:
                    let token: Token = Mapper<Token>().map(JSONObject: response.value)!
                    success(token)
                    break
                case .failure(_):
                    error()
                    break
                }
        }
    }
}
