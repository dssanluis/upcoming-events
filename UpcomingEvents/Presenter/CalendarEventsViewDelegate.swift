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
    
    let dependencies: CalendarEventsDependencies
    
    private var datesTitle: [Date] = []
    
    weak private var calendarEventsViewDelegate : CalendarEventsViewDelegate?
    
    init(dependencies: CalendarEventsDependencies){
        self.dependencies = dependencies
    }
    
    func setViewDelegate(calendarEventsViewDelegate: CalendarEventsViewDelegate?) {
        self.calendarEventsViewDelegate = calendarEventsViewDelegate
    }
    
    func getEvents() {
        let events = dependencies.getEventsUseCase.invoke()
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
            
            let viewDatas = dependencies.getConflictEventUseCase
                .invoke(events: eventWithoutConflict)
                .map { EventViewData(event: $0) }

            sections.append(viewDatas)
        }
        
        calendarEventsViewDelegate?.display(events: sections)
    }
}

