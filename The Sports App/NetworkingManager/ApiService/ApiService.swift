//
//  ApiService.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import Foundation

protocol ApiService {
//    func fetchSports<T: Codable>(endPoint: String) async -> (Result<T, Error>)
    func fetchSports<T: Codable>(endPoint: String, model: T.Type) async throws -> T
}
