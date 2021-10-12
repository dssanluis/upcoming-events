//
//  CalendarEventsViewDelegate.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

protocol CalendarEventsViewDelegate: AnyObject {
    func display(events: [EventViewData])
}

protocol CalendarEventsPresenterInputs {
    func getEvents()
}

class CalendarEventsPresenter: CalendarEventsPresenterInputs {
    
    private let getEventsUseCase: GetEventUseCase
    
    weak private var calendarEventsViewDelegate : CalendarEventsViewDelegate?
    
    init(getEventsUseCase: GetEventUseCase){
        self.getEventsUseCase = getEventsUseCase
    }
    
    func setViewDelegate(calendarEventsViewDelegate: CalendarEventsViewDelegate?) {
        self.calendarEventsViewDelegate = calendarEventsViewDelegate
    }
    
    func getEvents() {
        let events = getEventsUseCase.invoke()
        let viewDatas: [EventViewData] = events.map { EventViewData(event: $0) }
        self.calendarEventsViewDelegate?.display(events: viewDatas)
    }
}

