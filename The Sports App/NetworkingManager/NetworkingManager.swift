//
//  NetworkingManager.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import Foundation
//class NetworkManager: ApiService {
//    func fetchSports<T>(endPoint: String) async -> (Result<T, Error>) where T : Codable {
//        if let url = URL(string: UrlServices(endPoint: endPoint).url) {
//           await URLSession.shared.dataTask(with: url) { data, responce, error in
//                if let data = data {
//                    let decodedArray:[T] = convertFromJson(data: data) ?? []
//                }
//            }
//        }
//    }
//
//
//}
class NetworkManager: ApiService {
    static let shared = NetworkManager()
    private init() {}
    func fetchSports<T: Codable>(endPoint: String, model: T.Type) async throws -> T  {
        let url = URL(string: UrlServices(endPoint: endPoint).url)
        let (data, _) = try await URLSession.shared.data(from: url!)
        print(data)
        return try JSONDecoder().decode(T.self , from: data)
    }
    
//    func fetchSports<T>(endPoint: String) async throws -> T where T : Decodable, T : Encodable {
//        let url = URL(string: UrlServices(endPoint: endPoint).url)
//        let (data, _) = try await URLSession.shared.data(from: url!)
//        print(data)
//        return try JSONDecoder().decode(T.self, from: data)
//
//    }
    
}
