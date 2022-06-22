//
//  ApiService.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import Foundation

protocol ApiService {

    func fetchNetworkingData<T: Codable>(endPoint: String, model: T.Type) async throws -> T
}
