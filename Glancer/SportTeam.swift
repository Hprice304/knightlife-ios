//
//  SportTeam.swift
//  Glancer
//
//  Created by Dylan Hanson on 11/4/17.
//  Copyright © 2017 BB&N. All rights reserved.
//

import Foundation

struct SportTeam
{
	let id: Int
	let type: SportType
	let season: SportSeason
	let gender: SportGender
	let tier: SportTier
	
	init(id: Int, _ type: SportType, _ season: SportSeason, _ gender: SportGender, _ tier: SportTier)
	{
		self.id = id
		self.type = type
		self.season = season
		self.gender = gender
		self.tier = tier
	}
}

extension SportTeam: Hashable
{
	static func ==(lhs: SportTeam, rhs: SportTeam) -> Bool
	{
		return
			lhs.id == rhs.id &&
			lhs.gender == rhs.gender &&
			lhs.season == rhs.season &&
			lhs.tier == rhs.tier &&
			lhs.type == rhs.type
	}
	
	var hashValue: Int
	{
		return self.id ^ self.type.hashValue ^ self.season.hashValue ^ self.gender.hashValue ^ self.tier.hashValue
	}
}
