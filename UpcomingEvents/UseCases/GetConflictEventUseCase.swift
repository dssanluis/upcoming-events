//
//  GetConflictEventUseCase.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import Foundation

protocol GetConflictEventUseCase {
    func invoke(events: [Event]) -> [Event]
}

final class GetConflictEventUseCaseImp: GetConflictEventUseCase {
    
    func invoke(events: [Event]) -> [Event] {
        var newEvents: [Event] = []
        
        for event1 in events {
            var aux = event1
            for event2 in events {
                if aux != event2, aux.hasConflict == nil {
                    let hasConflict = aux.interset(event: event2) && aux.end != event2.start && event2.end != aux.start
                    aux.hasConflict = hasConflict
                    newEvents.append(aux)
                }
            }
        }
        
        return newEvents
    }
    
}
