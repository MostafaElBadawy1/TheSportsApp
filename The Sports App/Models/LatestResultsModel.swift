//
//  LatestResultsModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import Foundation
// MARK: - LatestResultsModel
struct LatestResultsModel: Codable {
    let events: [LatestResults]
}
// MARK: - LatestResults
struct LatestResults: Codable {
    let strHomeTeam, strAwayTeam: String
    let strTime, dateEvent: String
    let intHomeScore, intAwayScore: String
}
