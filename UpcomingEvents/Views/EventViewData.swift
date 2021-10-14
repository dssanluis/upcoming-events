//
//  EventViewData.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

struct EventViewData {
    private let event: Event
    
    init(event: Event) {
        self.event = event
    }
}

extension EventViewData {
    
    var title: String {
        "Title:" + " " + event.title
    }
    
    var startDate: String {
        let hour = getHour(date: event.start)
        return "Inicio:" + " " + event.startDate.toString(with: "MMMM dd") + ", " + hour
    }
    
    var endDate: String {
        let hour = getHour(date: event.end)
        return "Fin:" + " " + event.end.toString(with: "MMMM dd") + ", " + hour
    }
    
    var headerTitle: String {
        event.startDate.toString(with: "MMMM dd, yyyy")
    }
    
    private func  getHour(date: Date) -> String {
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([.hour, .minute])
        let components = calendar.dateComponents(unitFlags, from: date)
        let hour = calendar.date(from: components)!.toString(with: "HH:mm a")
        return hour
    }
    
    var status: String {
        if let hasConflict = event.hasConflict,
           hasConflict {
            return "Conflict"
        } else {
            return " "
        }
    }
}
