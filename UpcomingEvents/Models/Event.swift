//
//  Event.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

struct Event: Decodable, Equatable, Hashable {
    let title: String
    let start: Date
    let end: Date
    var hasConflict: Bool?
}

extension Event {
    var startDate: Date {
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.year, .month, .day])
        let components = calendar.dateComponents(unitFlags, from: self.start)
        return calendar.date(from: components)!
    }
    
    var hour: Int {
        Calendar.current.component(.hour, from: start)
    }
    
    var inteval: DateInterval {
        DateInterval(start: start, end: end)
    }
    
    func interset(event: Event) -> Bool {
        inteval.intersects(event.inteval)
    }
    
}
