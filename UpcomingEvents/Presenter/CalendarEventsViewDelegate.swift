//
//  CalendarEventsViewDelegate.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

protocol TrafficLightViewDelegate: NSObjectProtocol {
    func displayTrafficLight(description: String)
    func display(events: [Event])
}

protocol CalendarEventsPresenterInputs {
    func getEvents()
}

class CalendarEventsPresenter: CalendarEventsPresenterInputs {
    
    private let service: EventsService
    weak private var trafficLightViewDelegate : TrafficLightViewDelegate?
    
    init(service: EventsService){
        self.service = service
    }
    
    func setViewDelegate(trafficLightViewDelegate:TrafficLightViewDelegate?){
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func getEvents() {
        service
            .getEventsFromJson(callback: { [weak self] events in
                
                self?.trafficLightViewDelegate?.displayTrafficLight(description: events.count.description)
                
                self?.trafficLightViewDelegate?.display(events: events)
                
            })
    }
}
