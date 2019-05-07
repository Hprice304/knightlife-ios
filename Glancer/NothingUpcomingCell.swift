//
//  NothingUpcomingCell.swift
//  Glancer
//
//  Created by Dylan Hanson on 8/14/18.
//  Copyright © 2018 Dylan Hanson. All rights reserved.
//

import Foundation
import UIKit
import AddictiveLib

class NothingUpcomingCell: TableCell {
	
	init() {
		super.init("nothingupcoming", nib: "NothingUpcomingCell")
		
		self.setSelectionStyle(.none)
		
		self.setCallback() {
			template, cell in
			
            cell.backgroundColor = Scheme.spacercolor.color
            guard let prefCell = cell as? UINothingUpcomingCell else{
                return
            }
            
            prefCell.nothingLabel.textColor = Scheme.darkText.color
            prefCell.shieldIcon.image = prefCell.shieldIcon.image?.withRenderingMode(.alwaysTemplate)
            prefCell.shieldIcon.tintColor = Scheme.darkText.color
            prefCell.backgroundColor = Scheme.Backgrounddark.color
		}
	}
	
}

class UINothingUpcomingCell: UITableViewCell {
	
	
    @IBOutlet weak var nothingLabel: UILabel!
    @IBOutlet weak var shieldIcon: UIImageView!
    
}
