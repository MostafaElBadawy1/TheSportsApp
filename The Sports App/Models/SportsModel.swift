//
//  SportModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import Foundation
//struct  SportsModel : Codable {
//    let sports : [SportsM]
//}
//struct SportsM : Codable {
//    let strSport : String
//    let strSportThumb : String
//}
// MARK: - SportsModel
struct SportsModel: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String
//    let strFormat: StrFormat
//    let strSportThumb: String
//    let strSportIconGreen: String
//    let strSportDescription: String
}

//enum StrFormat: String, Codable {
//    case eventSport = "EventSport"
//    case teamvsTeam = "TeamvsTeam"
//}
