//
//  TodayBetweenClassModule.swift
//  Glancer
//
//  Created by Dylan Hanson on 8/19/18.
//  Copyright © 2018 Dylan Hanson. All rights reserved.
//

import Foundation
import AddictiveLib

class TodayBetweenClassModule: TableModule {
	
	let controller: DayController
	let bundle: DayBundle
	let nextBlock: Block
	let minutesUntil: Int
	
	init(controller: DayController, bundle: DayBundle, nextBlock: Block, minutesUntil: Int) {
		self.controller = controller
		self.bundle = bundle
		self.nextBlock = nextBlock
		self.minutesUntil = minutesUntil
		
		super.init()
	}
	
	override func build() {
		let analyst = BlockAnalyst(schedule: bundle.schedule, block: self.nextBlock)
		
		let state = analyst.getCourse() == nil ? "\(analyst.getDisplayName()) starting soon" : "Get to \(analyst.getDisplayName())"
		
		let todaySection = self.addSection()
		todaySection.addCell(TodayStatusCell(state: state, minutes: self.minutesUntil, image: UIImage(named: "icon_class")!, color: analyst.getColor()))
		
		self.addModule(BlockListModule(controller: self.controller, bundle: self.bundle, title: nil, blocks: [ self.nextBlock ], options: [ .topBorder, .bottomBorder ]))
		
		let section = self.addSection()
		section.addSpacerCell().setBackgroundColor(Scheme.spacercolor.color).setHeight(30)
		
		let upcomingBlocks = self.bundle.schedule.getBlocksAfter(self.nextBlock)
		
		self.addModule(BlockListModule(controller: self.controller, bundle: self.bundle, title: nil, blocks: upcomingBlocks, options: [ .topBorder, .bottomBorder ]))
		
		if self.bundle.events.hasOutOfSchoolEvents {
			self.addModule(AfterSchoolEventsModule(bundle: self.bundle, title: "After School", options: [ .bottomBorder ]))
		}
		
		self.addSection().addSpacerCell().setBackgroundColor(Scheme.spacercolor.color).setHeight(35)
	}
	
}
