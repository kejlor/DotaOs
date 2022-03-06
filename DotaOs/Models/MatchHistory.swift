//
//  MatchHistory.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 02/03/2022.
//

import Foundation

/*
 [
   {
     "match_id": 6454914696,
     "player_slot": 129,
     "radiant_win": true,
     "duration": 2202,
     "game_mode": 22,
     "lobby_type": 7,
     "hero_id": 91,
     "start_time": 1646078952,
     "version": null,
     "kills": 6,
     "deaths": 9,
     "assists": 7,
     "skill": null,
     "leaver_status": 0,
     "party_size": 2
   },
 ]
 */

struct MatchHistory: Codable {
    let matchHistory: [Match]
}

struct Match: Codable {
    let matchId: Int
    let duration, heroId, kills, deaths, assists: Int
        
    enum CodingKeys: String, CodingKey {
        case matchId = "match_id"
        case duration
        case heroId = "hero_id"
        case kills, deaths, assists
    }
}

extension Match: Identifiable {
    var id: Int { return matchId}
}
