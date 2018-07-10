//
//  TimeInterval+Formatting.swift
//  FitWell
//
//  Created by Lefteris Haritou on 10/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

extension TimeInterval {
    func timeIntervalAsString(allowedUnits:NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = allowedUnits
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self)!
    }
}
