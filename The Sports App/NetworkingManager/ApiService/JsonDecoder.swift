//
//  JsonDecoder.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import Foundation

func convertFromJson<T: Codable>(data:Data) -> T? {
    let jsonDecoder = JSONDecoder()
    let decodedArray = try? jsonDecoder.decode(T.self, from: data)
    print(decodedArray)
    return decodedArray
}
