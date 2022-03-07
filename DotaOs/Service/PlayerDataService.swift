//
//  PlayerDataService.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 06/03/2022.
//

import Foundation
import Combine

class PlayerDataService {
    @Published var player: Player? = nil
    
    var playerSubscription: AnyCancellable?
    let playerId: String
    
    init(playerId: String) {
        self.playerId = playerId
    }
    
    func getPlayer() {
        guard let url = URL(string: "https://api.opendota.com/api/players/\(playerId)") else { return }
        
        playerSubscription = NetworkingManager.download(url: url)
            .decode(type: Player.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedPlayer) in
                self?.player = returnedPlayer
                self?.playerSubscription?.cancel()
            })
    }
}
