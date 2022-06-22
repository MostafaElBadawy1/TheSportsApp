//
//  LatestResultsModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import Foundation
// MARK: - LatestResultsModel
struct LatestResultsModel: Codable {
    let LatestResults: [LatestResults]
}
// MARK: - LatestResults
struct LatestResults: Codable {
    let strHomeTeam, strAwayTeam, strTime, dateEvent: String
}
