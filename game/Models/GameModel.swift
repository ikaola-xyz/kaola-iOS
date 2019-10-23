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
            .responseJSON { response in
                if(response.error == nil){
                    let results : Array<Game> = Mapper<Game>().mapArray(JSONObject: response.value)!
                    callback(results)
                }
        }
    }
}
