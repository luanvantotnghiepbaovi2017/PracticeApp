//
//  UIScreen.swift
//  NashTechPracticeApp
//
//  Created by Software Engineer on 9/12/18.
//  Copyright © 2018 Software Engineer. All rights reserved.
//

import UIKit

extension UIScreen {
    var type: UIScreenType {
        let size = UIScreen.main.bounds.size
        switch size.height {
        case 480:
            return .isIphone4
        case 568:
            return .isIphone5
        case 667:
            return .isIphone6
        case 736:
            return .isIphone6Plus
        case 812:
            return .isIphoneX
        default:
            return .unKnown
        }
    }
}

enum UIScreenType {
    case isIphone4
    case isIphone5
    case isIphone6
    case isIphone6Plus
    case isIphoneX
    case unKnown
}

struct Device{
    static let screenWidth  = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let maxLength = max(Device.screenWidth, Device.screenHeight)
    static let minLenght = min(Device.screenWidth, Device.screenHeight)
}
