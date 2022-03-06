//
//  MatchHistoryService.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 02/03/2022.
//

import Foundation
import Combine

class MatchHistoryService: ObservableObject {
    @Published var allMatches: [Match] = []
    
    var matchHistorySubscription: AnyCancellable?
    
    init() {
        getMatchHistory()
    }
    
    func getMatchHistory() {
        guard let url = URL(string: "https://api.opendota.com/api/players/58317096/matches") else { return }
        
        matchHistorySubscription = NetworkingManager.download(url: url)
            .decode(type: [Match].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedMatchHistory) in
                self?.allMatches = returnedMatchHistory
                self?.matchHistorySubscription?.cancel()
            })
    }
}
