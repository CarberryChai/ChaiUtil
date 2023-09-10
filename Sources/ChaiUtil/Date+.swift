//
//  File.swift
//  
//
//  Created by changlin on 2023/9/9.
//

import Foundation

extension Date {
    public func isSameDay(_ day: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: day)
    }
}
