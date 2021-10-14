//
//  EventsServiceAPITest.swift
//  UpcomingEventsTests
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import XCTest
@testable import UpcomingEvents

class EventsServiceAPITest: XCTestCase {
    
    func test_getEventsSuccess() {
        let sut = EventsServiceAPIImp()
        
        let events = sut.getEventsFromJSON()
        
        XCTAssertFalse(events.isEmpty)
    }
    
    func test_getEmptyEventsSuccess() {
        let sut = EventsServiceAPIImp(fileName: "mock1")
        
        let events = sut.getEventsFromJSON()
        
        XCTAssertTrue(events.isEmpty)
    }
}
