//
//  LeaguesModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 20/06/2022.
//
import Foundation
// MARK: - SportsModel
struct LeaguesModel: Codable {
    let leagues: [League]
}
// MARK: - League
struct League: Codable {
    let idLeague, strLeague, strSport: String
    let strLeagueAlternate: String?
}
