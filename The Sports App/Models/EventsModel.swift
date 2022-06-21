//
//  EventsModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import Foundation
// MARK: - EventsModel
struct EventsModel: Codable {
    let Events: [Event]
}
// MARK: - League
struct Event: Codable {
    let strEvent, strTime, dateEvent: String
}
