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

extension JSONDecoder.DateDecodingStrategy {
    static let monthDayYearTime = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        guard let date = Formatter.custom.date(from: string) else {
            throw DecodingError.dataCorruptedError(in: container,
                  debugDescription: "Invalid date: " + string)
        }
        return date
    }
}

extension Formatter {
    static let custom: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale.current
        formatter.dateFormat = "MMMM d, yyyy h:mm a"
        return formatter
    }()
}
