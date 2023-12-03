//
//  MTUserDefaults.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 29/11/23.
//

import Foundation

struct MTUserDefaults {
    static var shared = MTUserDefaults()
    
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .device
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
    
}
