//
//  FreeBlocksPrefCell.swift
//  Glancer
//
//  Created by Henry Price on 4/23/19.
//  Copyright © 2019 Dylan Hanson. All rights reserved.
//

import Foundation
import AddictiveLib
import UIKit

class FreeBlocksPrefCell: TableCell {
    
    init(module: BlockPrefsModule, meta: BlockMeta) {
        super.init("blockspref", nib: "FreeBlocksPrefCell")
        
        self.setHeight(44)
        
        self.setSelection() {
            _, _ in
            module.selected(meta: meta)
        }
        
        self.setCallback() {
            template, cell in
            
            guard let prefCell = cell as? FreeUIBlocksPrefCell else {
                return
            }
            
            prefCell.titleLabel.text = meta.block.displayName
            prefCell.titleLabel.textColor = meta.color
        }
    }
    
}

class FreeUIBlocksPrefCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
}
