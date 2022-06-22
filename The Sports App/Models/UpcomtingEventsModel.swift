//
//  EventsModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import Foundation
// MARK: - UpcomtingEventsModel
struct UpcomtingEventsModel: Codable {
    let events: [UpcomtingEvents]
}
// MARK: - UpcomtingEvents
struct UpcomtingEvents: Codable {
    let strEvent, strTime, dateEvent: String
}
