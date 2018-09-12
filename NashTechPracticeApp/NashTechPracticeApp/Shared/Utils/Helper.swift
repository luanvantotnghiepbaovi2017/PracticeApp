//
//  Helper.swift
//  NashTechPracticeApp
//
//  Created by Software Engineer on 9/12/18.
//  Copyright © 2018 Software Engineer. All rights reserved.
//

import UIKit

func LocalizedString(_ s: String) -> String {
    let lprojPath = Bundle.main.path(forResource: LanguageManager.shared.currentLanguage.code, ofType: "lproj")
    let appBundle = Bundle(path: lprojPath!)!
    return NSLocalizedString(s, tableName: nil, bundle: appBundle, value: "", comment: "")
}

func Log(_ s: CustomStringConvertible, file: String = #file, line: Int = #line) {
    #if DEBUG
    let fileName = file.components(separatedBy: "/").last!
    let df = DateFormatter()
    df.dateFormat = "HH:mm:ss"
    let date = df.string(from: Date())
    print("[\(date) \(fileName) L\(line)] \(s)")
    #endif
}

func colorFromRGB(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
}

func getStatusBarHeight() -> CGFloat {
    return UIApplication.shared.statusBarFrame.height
}

func isiPhoneX() -> Bool {
    if #available(iOS 11.0, *) {
        if UIApplication.shared.statusBarFrame.height >= CGFloat(44) {
            return true
        }
    }
    return false
}

enum SafeAreaInsetEdge {
    case top
    case bottom
    case left
    case right
}

func getSafeAreaPaddingiPhoneX(_ edge: SafeAreaInsetEdge) -> CGFloat {
    if isiPhoneX() {
        let window = UIApplication.shared.keyWindow
        switch edge {
        case .top:
            return window?.safeAreaInsets.top ?? 0.0
        case .bottom:
            return window?.safeAreaInsets.bottom ?? 0.0
        case .left:
            return window?.safeAreaInsets.left ?? 0.0
        case .right:
            return window?.safeAreaInsets.right ?? 0.0
        }
    }
    return 0.0
}
