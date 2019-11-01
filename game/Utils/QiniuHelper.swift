//
//  QiniuHelper.swift
//  game
//
//  Created by Eric on 14/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import Qiniu
import Alamofire
import ObjectMapper

class QiniuHelper{
    
    class func uploadImage(image: UIImage, callback: @escaping (String)->Void) -> Void {
        postUploadToken(success: { (token) in
            upload(token: token, image: image, callback: callback)
        }, error: {
            callback("")
        })
    }
    
    class func postUploadToken(success: @escaping (String)->Void, error: @escaping ()->Void){
        let url = ApiUtils.uploadToken()
        AF.request(url, method: .post)
            .validate().responseJSON { (response) in
                switch response.result{
                case .success:
                    let token: UploadToken = Mapper<UploadToken>().map(JSONObject: response.value)!
                    print("postUploadToken:\(token.token)")
                    success(token.token)
                    break
                case .failure:
                    error()
                    break
                }
        }
    }
    
    class func upload(token: String, image: UIImage, callback: @escaping (String)->Void) -> Void {
        print("upload")
        let uploadManager = QNUploadManager.init()
        let data = image.jpegData(compressionQuality: 0)
        uploadManager?.put(data, key: nil, token: token, complete: { (info, s, resp) in
            if(info!.isOK){
                callback(resp!["hash"] as! String)
            }else{
                callback("")
            }
        }, option: nil)
    }
    
}
