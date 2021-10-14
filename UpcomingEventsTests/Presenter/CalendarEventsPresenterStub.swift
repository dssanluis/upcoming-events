//
//  CalendarEventsPresenterStub.swift
//  UpcomingEventsTests
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import Foundation

@testable import UpcomingEvents

final class CalendarEventsPresenterStub: GetEventUseCase, GetConflictEventUseCase {
    var events: [Event] = []
    
    // MARK: - GetEventUseCase
    func invoke() -> [Event] {
        events
    }
    
    func invoke(with id: String) -> [Event] {
        events
    }
    
    // MARK: - GetConflictEventUseCase
    func invoke(events: [Event]) -> [Event] {
        events
    }
}
