//
//  EventsModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import Foundation
// MARK: - UpcomtingEventsModel
struct UpcomtingEventsModel: Codable {
    let events: [Events]
}
// MARK: - UpcomtingEvents
struct Events: Codable {
    let strEvent, strTime, dateEvent: String
}
