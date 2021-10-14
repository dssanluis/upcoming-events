//
//  GetConflictEventUseCaseTests.swift
//  UpcomingEventsTests
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import XCTest
@testable import UpcomingEvents

class GetConflictEventUseCaseTests: XCTestCase {

    func test_zero() {
        let eventExpect = Event(title: "test",
                                start: Date(),
                                end: Date(),
                                hasConflict: true)
        let sut = makeSUT()
        
        let events = sut.invoke(events: [eventExpect])
        
        XCTAssertTrue(events.isEmpty)
    }
    
    private func makeSUT(file: StaticString = #file,
                         line: UInt = #line) -> GetConflictEventUseCaseImp {
        
        let sut = GetConflictEventUseCaseImp()
        
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return (sut)
    }
}
