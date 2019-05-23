//
//  Themes.swift
//  Glancer
//
//  Created by Henry Price on 5/23/19.
//  Copyright © 2019 Dylan Hanson. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

enum Theme: Int {
    
    case white = 0
    case blue = 1
    case black = 2

    
    var singular: String {
        switch self {
        case .white:
            return "White"
        case .blue:
            return "Blue"
        case .black:
            return "Black"
        }
    }
    
}

extension DefaultsKeys {
    
    static let themeMigratedToRealm = DefaultsKey<Bool>("migrated.grade")
    static let themeLegacy = DefaultsKey<Int>("events.theme")
    
}

extension Theme {
    
    static var userTheme: Theme? {
        get {
            // Not yet migrated so fetch via legacy
//            if !Defaults[.themeMigratedToRealm] {
//                let legacyTheme = Defaults[.themeLegacy]
//
//                if let theme = Theme(rawValue: legacyTheme - 1) {
//                    // Save legacy in new value
//                    Defaults[.userTheme] = theme.rawValue
//
//                    print("Loaded user legacy theme \( theme.singular )")
//
//                    return theme
//                }
//            }
            return Theme(rawValue: Defaults[.userTheme] ?? -1)
        }
        
        set {
            // Set migrated to true so we don't accidentally overwrite new settings
            Defaults[.themeMigratedToRealm] = true
            
            Defaults[.userTheme] = newValue == nil ? nil : newValue!.rawValue
        }
    }
    
}
