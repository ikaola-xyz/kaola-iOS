//
//  TimeUtils.swift
//  game
//
//  Created by Eric on 2019/6/9.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

class TimeUtils{
    
    class func toTimeString(timestamp: Double) -> String{
//        let timeStamp = 1463241600
        let timeInterval:TimeInterval = TimeInterval(timestamp)
        let date = NSDate(timeIntervalSince1970: timeInterval)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm"
        let time = dateformatter.string(from: date as Date)
        return time
    }
}
