//
//  RegistrationWebCall.swift
//  Glancer
//
//  Created by Dylan Hanson on 2/16/18.
//  Copyright © 2018 Dylan Hanson. All rights reserved.
//

import Foundation
import AddictiveLib

class RegistrationWebCall: WebCall<Any> {
	
	init() {
		super.init(call: "device/register")
		
		self.setMethod(.post)
		self.parameter("device", val: Globals.DeviceID ?? "")
	}
	
	override func convertData(_ data: Data) -> Any? {
		return true
	}

}
