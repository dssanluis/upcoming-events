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
    func getEventDetail(idEvent: String)
}

class CalendarEventsPresenterImp: CalendarEventsPresenter {
    
    private let getEventsUseCase: GetEventUseCase
    
    private var datesTitle: [Date] = []
    
    weak private var calendarEventsViewDelegate : CalendarEventsViewDelegate?
    
    init(getEventsUseCase: GetEventUseCase){
        self.getEventsUseCase = getEventsUseCase
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
//            print($0.hour)
        }
        
        datesTitle = dates.map { $0 }.sorted(by: { $0 < $1 })
        
//        print(datesTitle)
        
        for date in datesTitle {
            let viewDatas: [EventViewData] = events
                .filter { $0.startDate == date }
                .sorted(by: { $0.hour < $1.hour })
                .map { EventViewData(event: $0) }

            sections.append(viewDatas)
        }
        
//        print(sections)
        calendarEventsViewDelegate?.display(events: sections)
        
//        let viewDatas: [EventViewData] = events.map { EventViewData(event: $0) }
//        self.calendarEventsViewDelegate?.display(events: viewDatas)
    }
    
    func getEventDetail(idEvent: String) {
        let events = getEventsUseCase.invoke(with: idEvent)
    }
}

