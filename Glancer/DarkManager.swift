//
//  DarkManager.swift
//  Glancer
//
//  Created by Henry Price on 4/29/19.
//  Copyright © 2019 Dylan Hanson. All rights reserved.
//

import Foundation
import AddictiveLib
import SwiftyUserDefaults
import Signals

extension DefaultsKeys {
    
    static fileprivate let userDarkModeToggle = DefaultsKey<Bool>("toggles.darkmode")
    
}

class DarkManager {
   
    static let instance = DarkManager()
    
    let showDarkWatcher = Signal<Bool>()
    
    var showDark: Bool {
        get {
            return Defaults[.userDarkModeToggle]
        }
        
        set {
            Defaults[.userDarkModeToggle] = newValue
            self.showDarkWatcher.fire(newValue)
            
            return
        }
        
    }
    
    init() {
        
    }
    
}
