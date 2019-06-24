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
    
    func publish(userId: String, gameId: String, title: String, content: String){
        print("strategy publish")
        let parameters = [
            "userId" : userId,
            "gameId" : gameId,
            "title" : title,
            "content" : content,
            "isPublished": "true"
        ]
        
        let url = ApiUtils.strategy()
        Alamofire.request(url, method: .post, parameters: parameters)
            .responseJSON { response in
                print(response)
        }
    }
}
