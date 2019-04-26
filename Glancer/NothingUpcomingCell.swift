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

            
		}
	}
    private func layout(cell: UINothingUpcomingCell) {
        cell.nothingLabel.textColor = Scheme.text.color
    }
}

class UINothingUpcomingCell: UITableViewCell {
    
	@IBOutlet weak var nothingLabel: UILabel!
	
}
