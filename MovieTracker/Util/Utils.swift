//
//  Utils.swift
//  MovieTracker
//
//  Created by Joel Sene on 27/07/18.
//  Copyright © 2018 Joel Sene. All rights reserved.
//

import Foundation

class Util {

	public static func convertDateFormat(from: String, to: String, dateString: String?) -> String? {
		let fromDateFormatter = DateFormatter()
		fromDateFormatter.dateFormat = from
		var formattedDateString: String? = nil
		if dateString != nil {
			let formattedDate = fromDateFormatter.date(from: dateString!)
			if formattedDate != nil {
				let toDateFormatter = DateFormatter()
				toDateFormatter.dateFormat = to
				formattedDateString = toDateFormatter.string(from: formattedDate!)
			}
		}
		return formattedDateString
	}
}
