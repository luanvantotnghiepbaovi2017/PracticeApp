//
//  LanguageManager.swift
//  NashTechPracticeApp
//
//  Created by Software Engineer on 9/12/18.
//  Copyright © 2018 Software Engineer. All rights reserved.
//

import Foundation

class LanguageManager {
    private init() {}
    static let shared = LanguageManager()
    
    var currentLanguage: LanguageType {
        get {
            let enCode = LanguageType.english.code
            let jpCode = LanguageType.japanese.code
            if let lang = UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String,
                lang.hasPrefix(enCode) || lang.hasPrefix(jpCode) {
                if lang.hasPrefix(enCode) {
                    return .english
                } else {
                    return .japanese
                }
            }
            return .english
        }
        set {
            UserDefaults.standard.setValue([newValue.code], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
    }
}

enum LanguageType {
    case english
    case japanese
    
    var name: String {
        switch self {
        case .english:
            return "English"
        case .japanese:
            return "Japanese"
        }
    }
    
    var code: String {
        switch self {
        case .english:
            return "en"
        case .japanese:
            return "ja"
        }
    }
}
