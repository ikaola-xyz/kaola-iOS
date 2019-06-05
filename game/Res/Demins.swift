//
//  Demins.swift
//  game
//
//  Created by Eric on 3/6/2019.
//  Copyright © 2019 Eric. All rights reserved.
//

import Foundation
import UIKit

let ScreenWidth: CGFloat = UIScreen.main.bounds.size.width

let ScreenHeight: CGFloat = UIScreen.main.bounds.size.height

let isX: Bool = (ScreenHeight == CGFloat(812) && ScreenWidth == CGFloat(375))
    || (ScreenHeight == CGFloat(896) && ScreenWidth == CGFloat(414))

let NavgationBarHeight: CGFloat = isX ? 88 : 64

let HEIGHT_TOOL_BAR: CGFloat = isX ? 88 : 64

let PADDING_DEFAULT: CGFloat = 16
