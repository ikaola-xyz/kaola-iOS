//
//  HtmlUtils.swift
//  game
//
//  Created by Eric on 4/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation

class HtmlUtils{
    
    class func htmlString(htmlString: String) -> String {
        
        let begin = "<html>"
        
        let headStart = "<head>"
        
        let css = "<link href='style.css' rel='stylesheet' type='text/css'>"
        
        let meta = "<meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=no'>"
        
        let headEnd = "</head>"
        
        let bodyBegin = "<body><div class='container'>"

        let bodyEnd = "</div></body>"

        let end = "</html>"

        return begin + headStart + css + meta + headEnd + bodyBegin + htmlString + bodyEnd + end
    }
}
