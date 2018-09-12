//
//  NSObject.swift
//  NashTechPracticeApp
//
//  Created by Software Engineer on 9/12/18.
//  Copyright © 2018 Software Engineer. All rights reserved.
//

import Foundation

extension NSObject {
    static var string: String {
        return String.init(describing: self)
    }
    var className: String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}
