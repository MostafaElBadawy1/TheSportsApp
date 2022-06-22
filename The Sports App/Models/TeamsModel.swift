//
//  TeamsModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//

import Foundation
// MARK: - TeamsModel
struct TeamsModel: Codable {
    let Teams: [Teams]
}
// MARK: - Teams
struct Teams: Codable {
    let strTeamFanart1, strTeam: String
}
