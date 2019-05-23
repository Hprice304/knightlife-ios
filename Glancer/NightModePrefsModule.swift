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
        
        section.addCell(SettingsTextCell(left: "Theme", right: Theme.userTheme == nil ? "White" : Theme.userTheme!.singular) {
            self.showChangeTheme()
        })
        
        section.addDivider()
        section.addSpacerCell().setBackgroundColor(Scheme.Backgrounddark.color).setHeight(35)
    }
    
    private func showChangeTheme() {
        let alert = UIAlertController(title: "Theme", message: "Changes the Theme for Knightlife", preferredStyle: .actionSheet)
        
        //        Array of tuples instead of dictionary so that it retains its order
        var blockActions: [(id: Theme, alert: UIAlertAction)] = []
        
        let handler: (UIAlertAction) -> Void = {
            alert in
            
            //            Get the tuple with this specific action, and thus its Block.ID
            guard let key = blockActions.filter({ $0.alert === alert }).first?.id else {
                return
            }
            
            Theme.userTheme = key
            self.controller.tableHandler.reload()
            self.controller.viewWillAppear(true)
        }
        
        blockActions = [
            (.white, UIAlertAction(title: "White", style: .default, handler: handler)),
            (.blue, UIAlertAction(title: "Blue", style: .default, handler: handler)),
            (.black, UIAlertAction(title: "Black", style: .default, handler: handler))
        ]
        
        // Set normal theme values to be checked
        for (id, action) in blockActions {
            if Theme.userTheme == id {
                action.setValue(true, forKey: "checked")
            }
            
            alert.addAction(action)
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.controller.present(alert, animated: true)
    }
    
}
