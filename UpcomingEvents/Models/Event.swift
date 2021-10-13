//
//  Event.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

struct Event: Decodable {
    let title: String
    let start: Date
    let end: Date
}

extension Event {
//    public static var jsonDateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM d, yyyy h:mm a"
//        formatter.timeZone = TimeZone.current
//        formatter.calendar = Calendar(identifier: .iso8601)
//        formatter.locale = Locale.current//(identifier: "en_US_POSIX")
//        return formatter
//    }()
//
//    // Parse dates into Struct variables.
    var startDate: Date {
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.year, .month, .day])
        let components = calendar.dateComponents(unitFlags, from: self.start)
        return calendar.date(from: components)!
    }
    
    var hour: Int {
        Calendar.current.component(.hour, from: start)
    }
    
    var interval: DateInterval {
        .init(start: self.start,
              end: self.end)
    }
    
    func intersects(with event: Event) -> Bool {
        interval.intersects(event.interval)
    }
}
