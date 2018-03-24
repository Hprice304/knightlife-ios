//
//  BlockViewController.swift
//  Glancer
//
//  Created by Dylan Hanson on 11/3/17.
//  Copyright © 2017 BB&N. All rights reserved.
//

import Foundation
import UIKit

class BlockViewTableController: ITableController
{
	var controller: BlockViewController!
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		self.buildRefreshControl()
	}
	
	private func buildRefreshControl()
	{
		self.tableView.refreshControl = UIRefreshControl()
		
		self.tableView.refreshControl?.layer.zPosition = -1
		self.tableView.refreshControl?.layer.backgroundColor = UIColor("FFB53D").cgColor
		self.tableView.refreshControl?.tintColor = UIColor.white
	}
	
	override func scrollViewDidScroll(_ scrollView: UIScrollView)
	{
		self.controller.didScroll(scrollView.contentOffset.y)
	}
	
	override func generateSections()
	{
		if self.controller.daySchedule == nil
		{
//			let section = TableSection()
//			let errorCell = TableCell("error")
//
//			errorCell.setHeight(max(20, self.view.frame.height - 70.0))
//			section.addCell(errorCell)
//
//			self.addTableSection(section)
		} else if self.controller.daySchedule!.isEmpty
		{
//			let section = TableSection()
//			let classCell = TableCell("no_class")
//
//			classCell.setHeight(max(20, self.view.frame.height - 70.0))
//			section.addCell(classCell)
//
//			self.addTableSection(section)
		} else
		{
			if TimeUtils.isToday(self.controller.date)
			{
				self.addTableModule(BlockTableModuleToday(controller: self.controller))
			}
			
			self.addTableModule(BlockTableModuleBlocks(controller: self.controller))
		}

		self.tableView.contentInset = UIEdgeInsets(top: self.controller.headerView.isHidden ? 0 : self.controller.actualHeaderHeight, left: 0, bottom: 0, right: 0)
		self.tableView.contentOffset = CGPoint(x: 0.0, y: -self.tableView.contentInset.top)
	}
}
