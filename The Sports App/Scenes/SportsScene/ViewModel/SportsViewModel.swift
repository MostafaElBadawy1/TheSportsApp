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
    init(apiService: ApiService = NetworkManager.shared) {
        self.apiService = apiService
    }
    func fetch() async ->  [Sport]? {
        let sports = try? await apiService.fetchNetworkingData(endPoint: "api/v1/json/2/all_sports.php", model: SportsModel.self)
        return sports?.sports
    }
}
