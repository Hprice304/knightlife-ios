//
//  DarkModeManager.swift
//  Glancer
//
//  Created by Henry Price on 4/26/19.
//  Copyright © 2019 Dylan Hanson. All rights reserved.
//

import Foundation
import AddictiveLib

class DarkManager: Manager {
    
    static let instance = DarkManager()
    
    private(set) var showDark: Bool!
    let showDarkWatcher = ResourceWatcher<Bool>()
    
    
    init() {
        super.init("Dark Manager")
        self.saveStorage()
    }
    

    
    func loadedShowDark(value: Bool) {
        self.showDark = value
    }
    
    func setShowDark(value: Bool) {
        self.showDark = value
        self.saveStorage()
        
        self.showDarkWatcher.handle(nil, self.showDark)
    }
    
}
