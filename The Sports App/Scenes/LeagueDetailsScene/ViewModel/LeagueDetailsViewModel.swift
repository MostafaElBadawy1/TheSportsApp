//
//  LeagueDetailsViewModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import Foundation

class LeagueDetailsViewModel {
    //var leagueArray: [League]?
    //var filterSport: Sport?
    var filterLeague : League?
    
    let apiService: ApiService
    init(apiService: ApiService = NetworkManager.shared) {
        self.apiService = apiService
    }
    //MARK: Fetching Upcoming Events
    func fetchUpcomingEvents(id: String) async ->  [UpcomtingEvents]? {
        let endpoint = "api/v1/json/2/eventsseason.php?id=\(id)"
        print(endpoint)
        let upcomtingEventsData = try? await apiService.fetchNetworkingData(endPoint: endpoint, model: UpcomtingEventsModel.self)
        return upcomtingEventsData?.events
    }
    //MARK: Fetching Latest Results
    func fetchLatestResults(id: String) async ->  [LatestResults]? {
        let latestResultsData = try? await apiService.fetchNetworkingData(endPoint: "api/v1/json/2/eventsseason.php?id=\(id)", model: LatestResultsModel.self)
        return latestResultsData?.events
    }
    //MARK: Fetching Latest Results
    func fetchTeams() async ->  [Teams]? {
        let TeamsData = try? await apiService.fetchNetworkingData(endPoint: "api/v1/json/2/search_all_teams.php?l=English%20League%20Championship", model: TeamsModel.self)
        return TeamsData?.teams
    }
}

