//
//  MatchHistoryService.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 02/03/2022.
//

import Foundation
import Combine

class MatchHistoryService {
    @Published var allMatches: [Match] = []
    
    var matchHistorySubscription: AnyCancellable?
    let playerId: String
    
    init(playerId: String) {
        self.playerId = playerId
        getMatchHistory()
    }
    
    func getMatchHistory() {
        guard let url = URL(string: "https://api.opendota.com/api/players/\(playerId)/matches") else { return }
        
        matchHistorySubscription = NetworkingManager.download(url: url)
            .decode(type: [Match].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedMatchHistory) in
                self?.allMatches = returnedMatchHistory
                self?.matchHistorySubscription?.cancel()
            })
    }
}
