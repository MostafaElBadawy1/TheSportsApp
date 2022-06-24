//
//  LeaguesModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 20/06/2022.
//
import Foundation
// MARK: - SportsModel
struct LeaguesModel: Codable {
    let countries: [League]
}
// MARK: - League
struct League: Codable {
    let strLeague, strSport, strYoutube, strBadge, idLeague: String
    let strLeagueAlternate: String?
}
