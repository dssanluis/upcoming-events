//
//  GetEventUseCaseTests.swift
//  UpcomingEventsTests
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import XCTest
@testable import UpcomingEvents

class GetEventUseCaseTests: XCTestCase {

    func test_callGetEventsuseCaseSuccess() {
        let sut = makeSUT()
        
        let events = sut.invoke()
        
        XCTAssertFalse(events.isEmpty)
    }
    
    func test_callGetEventUseCaseTwice() {
        let callOne = makeSUT().invoke()
        let callTwo = makeSUT().invoke()
        
        XCTAssertFalse(callOne.isEmpty)
        XCTAssertFalse(callOne.isEmpty)
        XCTAssertEqual(callOne.count, callTwo.count)
    }

    private func makeSUT(file: StaticString = #file,
                         line: UInt = #line) -> GetEventUseCaseImp {
        
        let sut = GetEventUseCaseImp(dependencies: .init())
        
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return (sut)
    }
}
