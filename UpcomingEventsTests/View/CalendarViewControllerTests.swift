//
//  CalendarViewControllerTests.swift
//  UpcomingEventsTests
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import XCTest
@testable import UpcomingEvents

class CalendarViewControllerTests: XCTestCase {
    
    func test_viewController_hasTableViewDelegate() {
        let (sut, _) = makeSUT()
        
        XCTAssertTrue(sut.tableView.delegate === sut, "Controller should be delegate for the table view")
    }
    
    func test_viewController_hasTableViewDataSource() {
        let (sut, _) = makeSUT()
        
        XCTAssertTrue(sut.tableView.dataSource === sut, "Controller should be delegate for the table view")
    }
    
    func test_numberOfSections() {
        let (sut, _) = makeSUT()
        
        XCTAssertEqual(sut.tableView.numberOfSections, sut.sections.count)
    }
    
    private func makeSUT(file: StaticString = #file,
                         line: UInt = #line) -> (sut: CalendarViewController,
                                                 stub: CalendarPresenterStub) {
        
        let stub = CalendarPresenterStub()
        let sut = CalendarViewController(presenter: stub)
        
        trackForMemoryLeaks(stub, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        
        sut.loadViewIfNeeded()
        
        return (sut, stub)
    }
}
