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
        event.title
    }
}
