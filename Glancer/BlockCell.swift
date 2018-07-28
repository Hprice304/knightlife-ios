//
//  BlockCell.swift
//  Glancer
//
//  Created by Dylan Hanson on 7/25/18.
//  Copyright © 2018 Dylan Hanson. All rights reserved.
//

import Foundation
import UIKit
import AddictiveLib

class BlockCell: TableCell {
	
	private let composite: CompositeBlock
	
	init(composite: CompositeBlock) {
		self.composite = composite
		
		super.init("block", nib: "BlockCell")
		
		self.setEstimatedHeight(70)
		
		self.setCallback() {
			template, cell in
			
			if let blockCell = cell as? UIBlockCell {
				self.layout(cell: blockCell)
			}
		}
	}
	
//	Set name label to bold if there's a class or not
	
	private func layout(cell: UIBlockCell) {
		let analyst = BlockAnalyst(schedule: self.composite.schedule, block: self.composite.block)
		let block = self.composite.block
		
//		Setup
		cell.nameLabel.text = analyst.getDisplayName()
		cell.blockNameLabel.text = block.id.displayName
		
		cell.fromLabel.text = block.time.start.prettyTime
		cell.toLabel.text = block.time.end.prettyTime
		
//		Formatting
		var heavy = !analyst.getCourses().isEmpty
		if block.id == .lab, let before = self.composite.schedule.getBlockBefore(block) {
			if !BlockAnalyst(schedule: self.composite.schedule, block: before).getCourses().isEmpty {
				heavy = true
			}
		}
		
		cell.nameLabel.font = UIFont.systemFont(ofSize: 22, weight: heavy ? .bold : .semibold)
		cell.nameLabel.textColor = analyst.getColor()
		
		cell.tagIcon.image = cell.tagIcon.image!.withRenderingMode(.alwaysTemplate)
		cell.rightIcon.image = cell.rightIcon.image!.withRenderingMode(.alwaysTemplate)
		
//		Attachments
		for arranged in cell.attachmentsStack.arrangedSubviews { cell.attachmentsStack.removeArrangedSubview(arranged) }
		
		if block.id == .lunch {
			if let _ = self.composite.lunch {
				cell.attachmentsStack.addArrangedSubview(LunchAttachmentView())
			}
		}
		
		for event in composite.events {
			let view = EventAttachmentView()
			view.text = event.description
			cell.attachmentsStack.addArrangedSubview(view)
		}
		
		cell.attachmentStackBottomConstraint.constant = cell.attachmentsStack.arrangedSubviews.count > 0 ? 10.0 : 0.0
	}
	
}

class UIBlockCell: UITableViewCell {
	
	@IBOutlet weak var nameLabel: UILabel!
	
	@IBOutlet weak var tagIcon: UIImageView!
	@IBOutlet weak var blockNameLabel: UILabel!
	
	@IBOutlet weak var fromLabel: UILabel!
	@IBOutlet weak var rightIcon: UIImageView!
	@IBOutlet weak var toLabel: UILabel!
	
	@IBOutlet weak var attachmentsStack: UIStackView!
	@IBOutlet weak var attachmentStackBottomConstraint: NSLayoutConstraint!
	
}
