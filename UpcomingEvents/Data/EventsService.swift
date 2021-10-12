//
//  GetEventsAPI.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 11/10/21.
//

import Foundation

class EventsService {
    
    func getEventsFromJson(callback: ([Event]) -> Void) {
        
        let fileName = "mock"
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let events = try? decoder.decode([Event].self, from: data)
        else {
            return callback([])
        }
        
        print(events)
        return callback(events)
    }
}
