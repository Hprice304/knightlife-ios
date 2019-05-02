//
//  LunchController.swift
//  Glancer
//
//  Created by Dylan Hanson on 7/27/18.
//  Copyright © 2018 Dylan Hanson. All rights reserved.
//

import Foundation
import UIKit
import AddictiveLib

class LunchController: UIViewController, TableHandlerDataSource {
	
	var menu: LunchMenu!
	
	@IBOutlet weak var tableView: UITableView!
	private var tableHandler: TableHandler!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableHandler = TableHandler(table: self.tableView)
		self.tableHandler.dataSource = self
		
		self.navigationItem.title = self.menu.title ?? "Lunch"
        
        self.view.backgroundColor = Scheme.Backgrounddark.color
        navigationController?.navigationBar.barTintColor = Scheme.Backgrounddark.color
        navigationController?.navigationBar.barStyle = StyleScheme.styleReg.styleColor
        self.tabBarController?.tabBar.barTintColor = Scheme.Backgrounddark.color

	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
        self.view.backgroundColor = Scheme.Backgrounddark.color
        navigationController?.navigationBar.barTintColor = Scheme.Backgrounddark.color
        navigationController?.navigationBar.barStyle = StyleScheme.styleReg.styleColor
        self.tabBarController?.tabBar.barTintColor = Scheme.Backgrounddark.color
        
		self.tableHandler.reload()
	}
	
	func buildCells(handler: TableHandler, layout: TableLayout) {
		let section = layout.addSection()
		
		section.addDivider()
		
		for item in self.menu.items {
			section.addCell(LunchItemCell(item: item, showAllergen: LunchManager.instance.showAllergens))
			section.addDivider()
		}
	}
	
}
