//
//  NetworkingManager.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import Foundation

class NetworkManager: ApiService {
    static let shared = NetworkManager()
    private init() {}
    func fetchNetworkingData<T: Codable>(endPoint: String, model: T.Type) async throws -> T  {
        let urlIfError = URL(string: UrlServices(endPoint: "api/v1/json/2/search_all_leagues.php?s=skiing").url)
        let url = URL(string: UrlServices(endPoint: endPoint).url)
        let (data,_) = try await URLSession.shared.data(from: url ?? urlIfError!)
        return try JSONDecoder().decode(T.self , from: data)
    }

    
}
