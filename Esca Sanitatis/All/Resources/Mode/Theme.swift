//
//  Theme.swift
//  Food
//
//  Created by Diyorbek Xikmatullayev on 29/11/23.
//

import Foundation
import UIKit
enum Theme: Int {
    case device
    case light
    case dark
    
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch self {
        case .device:
            return .unspecified
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
