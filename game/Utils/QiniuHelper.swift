//
//  QiniuHelper.swift
//  game
//
//  Created by Eric on 14/10/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import Qiniu

class QiniuHelper{
    
    class func upload(image: UIImage, callback: @escaping (String)->Void) -> Void {
        print("upload")
        let token = "txDS0aesVdq6TfdogqF3QWlVI6ETeWluKzTwQ9oA:DsFveoVW5hwOmZOrNL0Q9WgBi2k=:eyJzY29wZSI6ImlrYW9sYSIsImRlYWRsaW5lIjoxNTcxMTA4NTE2fQ=="
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
