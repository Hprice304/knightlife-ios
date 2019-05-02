//
//  ShowDarkStorage.swift
//  Glancer
//
//  Created by Henry Price on 4/29/19.
//  Copyright © 2019 Dylan Hanson. All rights reserved.
//

import Foundation
import AddictiveLib

class ShowDarkStorage: StorageHandler {
    
    let manager: DarkManager
    
    var storageKey: String = "color.show-dark"
    
    init(manager: DarkManager) {
        self.manager = manager
    }
    
    func saveData() -> Any? {
        return manager.showDark
    }
    
    func loadData(data: Any) {
        guard let val = data as? Bool else {
            self.loadDefaults()
            return
        }
        
        self.manager.loadedShowDark(value: val)
    }
    
    func loadDefaults() {
        self.manager.loadedShowDark(value: true)
        
    }
    
}
