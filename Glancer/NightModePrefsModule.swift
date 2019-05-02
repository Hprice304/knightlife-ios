//
//  NightModePrefsModule.swift
//  Glancer
//
//  Created by Henry Price on 4/26/19.
//  Copyright © 2019 Dylan Hanson. All rights reserved.
//

import Foundation
import AddictiveLib

class NightModePrefsModule: TableModule {
    
    let controller: SettingsController
    
    init(controller: SettingsController) {
        self.controller = controller
    }
    
    override func build() {
        let section = self.addSection()
        
        section.addDivider()
        section.addCell(TitleCell(title: "Color Mode"))
        section.addDivider()
        
        section.addCell(PrefToggleCell(title: "KNight Mode", on: DarkManager.instance.showDark) {
            DarkManager.instance.setShowDark(value: $0)
            self.controller.tableHandler.reload()
            self.controller.viewWillAppear(true)
        })
        
        section.addDivider()
        section.addSpacerCell().setBackgroundColor(Scheme.Backgrounddark.color).setHeight(35)
    }
    


}
