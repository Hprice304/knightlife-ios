//
//  GetScheduleWebCall.swift
//  Glancer
//
//  Created by Dylan Hanson on 11/3/17.
//  Copyright © 2017 BB&N. All rights reserved.
//

import Foundation

class GetScheduleWebCall: WebCall<ScheduleManager, GetScheduleResponse, [DayID: WeekdaySchedule]>
{    
	init(_ manager: ScheduleManager, token: ResourceFetchToken)
	{
		super.init(manager: manager, converter: GetScheduleConverter(), token: token, call: "request/schedule.php")
	}
    
	override func handleCall(url: String, call: String, completeCall: String, success: Bool, error: String?, data: [DayID : WeekdaySchedule]?)
	{
		if success
		{
			manager.out("Successfully downloaded template schedule")
		} else
		{
			manager.out("An error occured during web call: \(call): \(error!)")
		}
	}
}
