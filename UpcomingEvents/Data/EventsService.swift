//
//  GetEventsAPI.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

protocol EventsServiceAPI {
    func getEventsFromJSON() -> [Event]
}

final class EventsServiceAPIImp: EventsServiceAPI {
    
    func getEventsFromJSON() -> [Event] {
        let fileName = "mock"
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let events = try? decoder.decode([Event].self, from: data)
        else {
            return []
        }
        
        print(events)
        return events
    }
}
