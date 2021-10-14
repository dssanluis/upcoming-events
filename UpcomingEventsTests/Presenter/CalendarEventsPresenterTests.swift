//
//  CalendarEventsPresenterTests.swift
//  UpcomingEventsTests
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import XCTest
@testable import UpcomingEvents

class CalendarEventsPresenterTests: XCTestCase {

    func test_getEventsFromPresenter() {
        let event = Event(title: "test",
                          start: Date(),
                          end: Date(),
                          hasConflict: true)
        let eventsExpected = [event]
        let (sut, stub) = makeSUT()
        stub.events = eventsExpected
        
        sut.getEvents()
        
        XCTAssertEqual(eventsExpected.count, stub.events.count)
    }

    private func makeSUT(file: StaticString = #file,
                         line: UInt = #line) -> (sut: CalendarEventsPresenterImp,
                                                 stub: CalendarEventsPresenterStub) {
        
        let stub = CalendarEventsPresenterStub()
        let sut = CalendarEventsPresenterImp(dependencies: .init(getEventsUseCase: stub,
                                                                 getConflictEventUseCase: stub))
        
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(stub, file: file, line: line)
        
        return (sut, stub)
    }
}
