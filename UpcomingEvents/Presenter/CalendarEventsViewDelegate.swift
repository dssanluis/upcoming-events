//
//  CalendarEventsViewDelegate.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

protocol CalendarEventsViewDelegate: AnyObject {
    func display(events: [[EventViewData]])
}

protocol CalendarEventsPresenter {
    func getEvents()
    func setViewDelegate(calendarEventsViewDelegate: CalendarEventsViewDelegate?)
}

class CalendarEventsPresenterImp: CalendarEventsPresenter {
    
    private let getEventsUseCase: GetEventUseCase
    private let getConflictEventUseCase: GetConflictEventUseCase
    
    private var datesTitle: [Date] = []
    
    weak private var calendarEventsViewDelegate : CalendarEventsViewDelegate?
    
    init(getEventsUseCase: GetEventUseCase,
         getConflictEventUseCase: GetConflictEventUseCase){
        self.getEventsUseCase = getEventsUseCase
        self.getConflictEventUseCase = getConflictEventUseCase
    }
    
    func setViewDelegate(calendarEventsViewDelegate: CalendarEventsViewDelegate?) {
        self.calendarEventsViewDelegate = calendarEventsViewDelegate
    }
    
    func getEvents() {
        let events = getEventsUseCase.invoke()
        var dates = Set<Date>()
        var sections: [[EventViewData]] = []
        
        events.forEach {
            dates.insert($0.startDate)
        }
        
        datesTitle = dates.map { $0 }.sorted(by: { $0 < $1 })
        
        for date in datesTitle {

            let eventWithoutConflict = events
                .filter { $0.startDate == date }
                .sorted(by: { $0.hour < $1.hour })
            
            let viewDatas = getConflictEventUseCase
                .invoke(events: eventWithoutConflict)
                .map { EventViewData(event: $0) }

            sections.append(viewDatas)
        }
        
        calendarEventsViewDelegate?.display(events: sections)
    }
}

