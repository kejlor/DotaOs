//
//  Player.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 02/03/2022.
//

import Foundation

/*
{
"tracked_until": "string",
"solo_competitive_rank": "string",
"competitive_rank": "string",
"rank_tier": 0,
"leaderboard_rank": 0,
"mmr_estimate": {
"estimate": 0
},
"profile": {
"account_id": 0,
"personaname": "string",
"name": "string",
"plus": true,
"cheese": 0,
"steamid": "string",
"avatar": "string",
"avatarmedium": "string",
"avatarfull": "string",
"profileurl": "string",
"last_login": "string",
"loccountrycode": "string",
"is_contributor": false
}
}
*/

struct Player: Codable, Identifiable {
    var id = UUID().uuidString
    let profile: Profile
}

struct Profile: Codable {
    let accountId: Int
    let personName, avatarFull, profileURL, locCountryCode: String
    
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case personName = "personname"
        case avatarFull = "avatarfull"
        case profileURL = "profileurl"
        case locCountryCode = "loccountrycode"
    }
}

extension Profile: Identifiable {
    var id: Int { return accountId}
}
