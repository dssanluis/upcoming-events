//
//  GetEventUseCase.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

protocol GetEventUseCase {
    func invoke() -> [Event]
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
        dependencies
            .getEventsAPI
            .getEventsFromJSON()
    }
}
