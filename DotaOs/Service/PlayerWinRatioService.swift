//
//  PlayerWinRatioService.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 07/03/2022.
//

import Foundation
import Combine

class PlayerWinRatioService {
    @Published var winRatio: WinRatio? = nil
    
    var playerSubscription: AnyCancellable?
    let playerId: String
    
    init(playerId: String) {
        self.playerId = playerId
    }
    
    func getPlayer() {
        guard let url = URL(string: "https://api.opendota.com/api/players/\(playerId)/wl") else { return }
        
        playerSubscription = NetworkingManager.download(url: url)
            .decode(type: WinRatio.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedWinRatio) in
                self?.winRatio = returnedWinRatio
                self?.playerSubscription?.cancel()
            })
    }
}
