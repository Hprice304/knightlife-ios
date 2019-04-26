//
//  ShowDarkStorage.swift
//  Glancer
//
//  Created by Henry Price on 4/26/19.
//  Copyright © 2019 Dylan Hanson. All rights reserved.
//

import Foundation
import AddictiveLib

class ShowDark: StorageHandler {
    
    let manager: DarkManager
    
    var storageKey: String = "dark.show-view"
    
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
