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
              //https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4328&s=2022-2023
              //https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20League%20Championship
             //https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=4617
             //https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=Soccer
    }
    
}
