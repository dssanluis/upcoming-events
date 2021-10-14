//
//  XCTestCase+MemoryLeakTracking.swift
//  UpcomingEventsTests
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memoryLeak", file: file, line: line)
        }
    }
}

