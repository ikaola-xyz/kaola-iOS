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
        let url = ApiUtils.strategy(id: id)
        Alamofire.request(url).responseJSON { (response) in
            if(response.result.isSuccess){
                let result: Strategy = Mapper<Strategy>().map(JSONObject: response.result.value)!
                callback(result)
            }
        }
    }
    
    func getAll(callback: @escaping (Array<Strategy>)->Void){
        let url = ApiUtils.strategy()
        Alamofire.request(url)
            .responseJSON { response in
                if(response.result.isSuccess){
                    let results : Array<Strategy> = Mapper<Strategy>().mapArray(JSONObject: response.result.value)!
                    callback(results)
                }
        }
    }
    
    func publish(userId: String, gameId: String, title: String, content: String, callback: @escaping (Bool)->Void){
        print("strategy publish")
        let parameters = [
            "userId" : userId,
            "gameId" : gameId,
            "title" : title,
            "content" : content,
            "isPublished": "true"
        ]
        
        let headers = [
            "Authorization": "db53954fe36070b2c3f01449cb790d8e"
        ]
        
        let url = ApiUtils.strategy()
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers)
            .validate()
            .responseJSON { response in
                if(response.result.isSuccess){
                    print("publish success")
                    callback(true)
                }else{
                    print("publish failed")
                    callback(false)
                }
                print(response)
        }
    }
}
