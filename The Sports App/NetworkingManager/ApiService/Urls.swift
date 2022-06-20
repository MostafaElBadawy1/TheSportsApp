//
//  Urls.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 19/06/2022.
//

import Foundation

struct UrlServices {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/\(endPoint)"
        //https://www.thesportsdb.com/api/v1/json/2/all_sports.php
        //https://www.thesportsdb.com/api/v1/json/2/all_leagues.php
    }
    
}
