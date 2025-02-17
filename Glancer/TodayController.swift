//
//  TodayController.swift
//  Glancer
//
//  Created by Dylan Hanson on 7/25/18.
//  Copyright © 2018 Dylan Hanson. All rights reserved.
//

import Foundation
import UIKit
import AddictiveLib
import SnapKit

class TodayController: DayController {
	
	private var state: TodayManager.TodayScheduleState!
	
	private var showStatusBar = false
	override var prefersStatusBarHidden: Bool {
		return !self.showStatusBar
	}
	
	override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
		return .slide
	}
	
	override func viewDidLoad() {
		self.date = Date.today
        self.view.backgroundColor = Scheme.Backgrounddark.color
        navigationController?.navigationBar.barTintColor = Scheme.Backgrounddark.color
        navigationController?.navigationBar.barStyle = StyleScheme.styleReg.styleColor
        self.tabBarController?.tabBar.barTintColor = Scheme.Backgrounddark.color

		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        self.view.backgroundColor = Scheme.Backgrounddark.color
        navigationController?.navigationBar.barTintColor = Scheme.Backgrounddark.color
        navigationController?.navigationBar.barStyle = StyleScheme.styleReg.styleColor
        self.tabBarController?.tabBar.barTintColor = Scheme.Backgrounddark.color

		TodayManager.instance.startTimer()
		self.handleStateChange(state: TodayManager.instance.currentState)
		
//		Animate status bar for first load
		let animateStatus: Bool = Globals.getData("animate-status") ?? false
		self.showStatusBar = true
		if animateStatus {
			Globals.setData("animate-status", data: false)
			
			UIView.animate(withDuration: 0.5) {
				self.setNeedsStatusBarAppearanceUpdate()
			}
		} else {
			self.setNeedsStatusBarAppearanceUpdate()
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		self.tableHandler.reload() // Deal with any pesky layout constraint bugs.
	}
	
	override func setupNavigationItem() {
		self.setupMailButtonItem()
		
		self.navigationItem.title = "Today"
		
		if let subtitleItem = self.navigationItem as? SubtitleNavigationItem {
			if let bundle = self.bundle {
				if bundle.schedule.changed {
					subtitleItem.subtitle = "Special"
					subtitleItem.subtitleColor = .red
					
					return
				}
			}
			
			subtitleItem.subtitle = Date.today.prettyDate
			subtitleItem.subtitleColor = UIColor.darkGray
		}
	}
	
	override func registerListeners() {
		TodayManager.instance.statusWatcher.onSuccess(self) {
			state in
			
			self.handleStateChange(state: state)
		}
	}
	
	override func unregisterListeners() {
//		Stop it from unregistering
	}
	
	override func reloadData() {
		switch TodayManager.instance.currentState {
		case .LOADING:
			break
		default:
			TodayManager.instance.reloadTodayBundle()
			break
		}
		
		self.handleStateChange(state: TodayManager.instance.currentState)
	}
	
	private func handleStateChange(state: TodayManager.TodayScheduleState) {
		self.state = state
		self.tableHandler.reload()
	}
	
	override func buildCells(handler: TableHandler, layout: TableLayout) {
		switch self.state! {
		case .LOADING:
			self.bundle = nil
			
			self.setupNavigationItem()
			
			layout.addModule(LoadingModule(table: self.tableView))
			break
		case .ERROR:
			self.bundle = nil
			
			self.setupNavigationItem()
			
			layout.addModule(ErrorModule(table: self.tableView, reloadable: self))
			break
		case let .NO_CLASS(today, nextDay):
			self.bundle = today
			
			self.date = today.date
			self.setupNavigationItem()
			self.showNotices()
			
			layout.addModule(TodayNoClassModule(controller: self, table: self.tableView, today: today, tomorrow: nextDay))
			break
		case let .BEFORE_SCHOOL(bundle, firstBlock, minutesUntil):
			self.bundle = bundle
			
			self.date = bundle.date
			self.setupNavigationItem()
			self.showNotices()
			
			layout.addModule(TodayBeforeSchoolModule(controller: self, today: bundle, firstBlock: firstBlock, minutesUntil: minutesUntil))
			break
		case let .BEFORE_SCHOOL_GET_TO_CLASS(bundle, nextBlock, minutesUntil):
			self.bundle = bundle
			
			self.date = bundle.date
			self.setupNavigationItem()
			self.showNotices()
			
			layout.addModule(TodayBetweenClassModule(controller: self, bundle: bundle, nextBlock: nextBlock, minutesUntil: minutesUntil))
			break
		case let .BETWEEN_CLASS(bundle, nextBlock, minutesUntil):
			self.bundle = bundle
			
			self.date = bundle.date
			self.setupNavigationItem()
			self.showNotices()
			
			layout.addModule(TodayBetweenClassModule(controller: self, bundle: bundle, nextBlock: nextBlock, minutesUntil: minutesUntil))
			break
		case let .IN_CLASS(bundle, current, next, minutesLeft):
			self.bundle = bundle
			
			self.date = bundle.date
			self.setupNavigationItem()
			self.showNotices()
			
			layout.addModule(TodayInClassModule(controller: self, bundle: bundle, current: current, next: next, minutesLeft: minutesLeft))
			break
		case let .AFTER_SCHOOL(bundle, nextDay):
			self.bundle = bundle
			
			self.date = bundle.date
			self.setupNavigationItem()
			self.showNotices()
			
			layout.addModule(TodayAfterSchoolModule(controller: self, table: self.tableView, today: bundle, tomorrow: nextDay))
			break
		}		
	}
	
}
