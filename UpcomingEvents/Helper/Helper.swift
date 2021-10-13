//
//  Helper.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 12/10/21.
//

import Foundation

extension String {
   
    func toDate(with format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
//        dateFormatter.timeZone = TimeZone.current
//        dateFormatter.locale = Locale.current
        let date = dateFormatter.date(from: self)
        return date
    }

    func parse(format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format
        dateFormatter.dateStyle = .short
        let date = dateFormatter.date(from: self)
        return date
    }

}


extension Date {
    
    func toString(with format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let string = dateFormatter.string(from: self)
        return string
    }
}
