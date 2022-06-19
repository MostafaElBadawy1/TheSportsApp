//
//  SportModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import Foundation
struct  SportsModel : Codable {
    let sports : [SportsM]
}
struct SportsM : Codable {
    let strSport : String
    let strSportThumb : String
}
