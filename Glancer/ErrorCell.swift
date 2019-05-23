//
//  ErrorCell.swift
//  Glancer
//
//  Created by Dylan Hanson on 7/29/18.
//  Copyright © 2018 Dylan Hanson. All rights reserved.
//

import Foundation
import UIKit
import AddictiveLib

class ErrorCell: TableCell {
	
	var reload: ErrorReloadable
	
	init(reloadable: ErrorReloadable) {
		self.reload = reloadable
		
		super.init("error", nib: "ErrorCell")
		
		self.setSelectionStyle(.none)
		
		self.setSelection() {
			template, cell in
			
			self.reload.reloadData()
		}
		
		self.setCallback() {
			template, cell in
			
			cell.backgroundColor = Scheme.Backgrounddark.color
            
            guard let prefCell = cell as? UIErrorCell else {
                return
            }
            
            prefCell.cloudError.image = prefCell.cloudError.image?.withRenderingMode(.alwaysTemplate)
            prefCell.cloudError.tintColor = Scheme.navtext.color
            prefCell.notLoad.textColor = Scheme.navtext.color
            prefCell.tryAgain.textColor = Scheme.navtext.color
            
		}
	}
	
}

class UIErrorCell: UITableViewCell {
	
    @IBOutlet weak var cloudError: UIImageView!
    @IBOutlet weak var notLoad: UILabel!
    @IBOutlet weak var tryAgain: UILabel!
    
	
}
