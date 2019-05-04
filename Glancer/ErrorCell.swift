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
        
//        let origImage = UIImageView(image: UIImage(named: "icon_error"))
//        origImage.image!.withRenderingMode(.alwaysTemplate)
//        origImage.borderColor = UIColor.black
//        origImage.tintColor = UIColor.white
		
		self.setSelection() {
			template, cell in
			
			self.reload.reloadData()
		}
        
		
		self.setCallback() {
			template, cell in
			cell.backgroundColor = Scheme.Backgrounddark.color
//            cell.textLabel?.textColor = Scheme.text.color
            
            guard let prefCell = cell as? UIErrorCell else {
                return
            }
            prefCell.errorIcon.image = prefCell.errorIcon.image?.withRenderingMode(.alwaysTemplate)
            prefCell.errorIcon.tintColor = Scheme.darkText.color
            
            prefCell.notLoad.textColor = Scheme.darkText.color
            prefCell.tryAgain.textColor = Scheme.darkText.color
            
		}
	}
	
}

class UIErrorCell: UITableViewCell {
	
    @IBOutlet weak var notLoad: UILabel!
    @IBOutlet weak var tryAgain: UILabel!
    @IBOutlet weak var errorIcon: UIImageView!
    
    
}
