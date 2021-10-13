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
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM dd, yyyy hh:mm a"
//        formatter.locale = Locale(identifier: "en_US_POSIX")

        let fileName = "mock"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .monthDayYearTime //.formatted(formatter)
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let events = try? decoder.decode([Event].self, from: data)
        else {
            return []
        }
        
        return events
    }
}


extension JSONDecoder.DateDecodingStrategy {
    static let monthDayYearTime = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        guard let date = Formatter.custom.date(from: string) else {
            throw DecodingError.dataCorruptedError(in: container,
                  debugDescription: "Invalid date: " + string)
        }
        return date
    }
}

extension Formatter {
    static let custom: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale.current //(identifier: "en_US_POSIX")
        formatter.dateFormat = "MMMM d, yyyy h:mm a"
        return formatter
    }()
}

