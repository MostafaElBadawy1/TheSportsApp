//
//  LeagueDetailsViewModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 21/06/2022.
//

import Foundation

class LeagueDetailsViewModel {
    //static let shared = LeagueDetailsViewModel()
    //private init(){}
    //var leagueArray: [League]?
    //var filterSport: Sport?
    let apiService: ApiService
    init(apiService: ApiService = NetworkManager()) {
        self.apiService = apiService
    }
    //MARK: Fetching Upcoming Events
    func fetchUpcomingEvents() async ->  [UpcomtingEvents]? {
        let upcomtingEventsData = try? await apiService.fetchNetworkingData(endPoint: "api/v1/json/2/eventsseason.php?id=4328&s=2022-2023", model: UpcomtingEventsModel.self)
        //print(upcomtingEventsData)
        return upcomtingEventsData?.events
    }
    //MARK: Fetching Latest Results
    func fetchLatestResults() async ->  [LatestResults]? {
        let latestResultsData = try? await apiService.fetchNetworkingData(endPoint: "api/v1/json/2/eventsseason.php?id=4617", model: LatestResultsModel.self)
        // print(latestResultsData)
        return latestResultsData?.events
    }
    //MARK: Fetching Latest Results
    func fetchTeams() async ->  [Teams]? {
        let TeamsData = try? await apiService.fetchNetworkingData(endPoint: "api/v1/json/2/search_all_teams.php?l=English%20League%20Championship", model: TeamsModel.self)
        // print(TeamsData)
        return TeamsData?.teams
    }
}

