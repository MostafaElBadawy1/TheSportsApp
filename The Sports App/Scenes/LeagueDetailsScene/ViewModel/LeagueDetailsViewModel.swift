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
    let apiService: ApiService
    init(apiService: ApiService = NetworkManager()) {
        self.apiService = apiService
    }
    //MARK: Fetching Upcoming Events
    func fetchUpcomingEvents() async ->  [Events]? {
        let upcomtingEventsData = try? await apiService.fetchNetworkingData(endPoint: "api/v1/json/2/eventsseason.php?id=4328&s=2022-2023", model: UpcomtingEventsModel.self)
        print(upcomtingEventsData)

        return upcomtingEventsData?.events
    }
}

