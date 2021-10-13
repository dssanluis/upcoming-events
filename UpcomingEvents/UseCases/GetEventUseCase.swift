//
//  GetEventUseCase.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

protocol GetEventUseCase {
    func invoke() -> [Event]
    func invoke(with id: String) -> [Event]
}

final class GetEventUseCaseImp {
    
    struct Dependencies {
        let getEventsAPI = EventsServiceAPIImp()
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension GetEventUseCaseImp: GetEventUseCase {
    
    func invoke() -> [Event] {
        
        let events = dependencies
            .getEventsAPI
            .getEventsFromJSON()
            .sorted(by: { $0.start < $1.start })
        
//        events.forEach {
//            print($0.title)
////            print($0.interval)
//        }
        
        return events
    }
    
    func invoke(with id: String) -> [Event] {
        let events = dependencies
            .getEventsAPI
            .getEventsFromJSON()
            .filter { $0.start.toString().contains(id) }
            .sorted(by: { $0.start < $1.start })
        
        print(events)
        return events
    }
}
