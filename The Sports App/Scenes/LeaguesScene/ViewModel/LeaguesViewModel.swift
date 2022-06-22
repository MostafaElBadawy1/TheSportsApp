//
//  LeaguesViewModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 20/06/2022.
//

import Foundation

class LeaguesViewModel {
    //var leagueArray: [League]?
    //var filterSport: Sport?
    let apiService: ApiService
    init(apiService: ApiService = NetworkManager()) {
        self.apiService = apiService
    }
    func fetch() async ->  [League]? {
        let leaguesData = try? await apiService.fetchNetworkingData(endPoint: "api/v1/json/2/all_leagues.php", model: LeaguesModel.self)
     // print(leaguesData)
        return leaguesData?.leagues
    }
}
  
