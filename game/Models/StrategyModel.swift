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
    
    func getAll(page:Int, size:Int, callback: @escaping (Array<Strategy>)->Void){
        let url = ApiUtils.strategies()
        
        let parameters = [
            "page" : String(page),
            "size" : String(size)
        ]
        
        AF.request(url, parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result{
                case .success:
                    let results : Array<Strategy> = Mapper<Strategy>().mapArray(JSONObject: response.value)!
                    callback(results)
                    break
                case .failure(_):
                    callback(Array<Strategy>())
                    break
                }
        }
    }
    
    func publish(userId: String, gameId: String, title: String, content: String, cover: String,callback: @escaping (Int)->Void){
        let parameters = [
            "userId" : userId,
            "gameId" : gameId,
            "title" : title,
            "content" : content,
            "cover" : cover,
            "isPublished": "true"
        ]
        
        let headers: HTTPHeaders = [
            "Authorization": LoginManager.getToken()
        ]
        
        let url = ApiUtils.strategies()
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers, interceptor: nil)
            .validate().responseJSON { (response) in
                switch response.result{
                case .success:
                    print("publish success")
                    callback(200)
                case .failure:
                    print("publish failed")
                    callback(401)
                }
                print(response)
        }
    }
}
