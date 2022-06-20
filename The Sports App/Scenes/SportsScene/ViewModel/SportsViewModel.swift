//
//  SportsViewModel.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 20/06/2022.
//

import Foundation
import UIKit
class SportsViewModel {
    let apiService: ApiService
    init(apiService: ApiService = NetworkManager()) {
        self.apiService = apiService
    }
    func fetch() async ->  [Sport]? {
        let sports = try? await apiService.fetchSports(endPoint: "api/v1/json/2/all_sports.php", model: SportsModel.self)
        return sports?.sports
    }
}
