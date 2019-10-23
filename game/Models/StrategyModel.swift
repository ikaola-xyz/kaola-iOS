//
//  StrategyModel.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class StrategyModel{
    
    func getById(id: String, callback: @escaping (Strategy)->Void){
        let url = ApiUtils.strategies(id: id)
        AF.request(url).responseJSON { (response) in
            if(response.error == nil){
                let result: Strategy = Mapper<Strategy>().map(JSONObject: response.value)!
                callback(result)
            }
        }
    }
    
    func getAll(callback: @escaping (Array<Strategy>)->Void){
        let url = ApiUtils.strategies()
        AF.request(url)
            .responseJSON { response in
                if(response.error == nil){
                    let results : Array<Strategy> = Mapper<Strategy>().mapArray(JSONObject: response.value)!
                    callback(results)
                }
        }
    }
    
    func publish(userId: String, gameId: String, title: String, content: String, cover: String,callback: @escaping (Bool)->Void){
        print("strategy publish")
        let parameters = [
            "userId" : userId,
            "gameId" : gameId,
            "title" : title,
            "content" : content,
            "cover" : cover,
            "isPublished": "true"
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": "a301d61a8b96548f95053556b6ddf7fd"
        ]
        
        let url = ApiUtils.strategies()
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers, interceptor: nil)
            .validate().responseJSON { (response) in
                if(response.error == nil){
                    print("publish success")
                    callback(true)
                }else{
                    print("publish failed")
                    callback(false)
                }
                print(response)
        }
        
//        AF.request(url, method: .post, parameters: parameters, headers: headers)
//            .validate()
//            .responseJSON { response in
//                if(response.error == nil){
//                    print("publish success")
//                    callback(true)
//                }else{
//                    print("publish failed")
//                    callback(false)
//                }
//                print(response)
//        }
    }
}
