//
//  GameModel.swift
//  game
//
//  Created by Eric on 16/9/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class GameModel{
    
    func getAll(callback: @escaping (Array<Game>)->Void){
        let url = ApiUtils.games()
        AF.request(url)
            .validate() //状态码在 (200..<300)
            .responseJSON { response in
                switch response.result{
                case .success:
                    print("success")
                    let results : Array<Game> = Mapper<Game>().mapArray(JSONObject: response.value)!
                    callback(results)
                case .failure:
                    print("failure")
                }
        }
    }
}
