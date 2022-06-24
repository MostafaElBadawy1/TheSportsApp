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
        let url = URL(string: UrlServices(endPoint: endPoint).url)
        let (data, _) = try await URLSession.shared.data(from: url!)
        return try JSONDecoder().decode(T.self , from: data)
    }

    
}
