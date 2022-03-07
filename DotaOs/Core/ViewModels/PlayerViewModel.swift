//
//  PlayerViewModel.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 07/03/2022.
//

import Foundation
import Combine
import CoreData

final class PlayerViewModel: ObservableObject {
//    let storage: CoreDataStore
//    let viewContext: NSManagedObjectContext
    
//    @Published var followedPlayers: [FollowedPlayer]
    @Published var allMatches: [Match] = []
    @Published var player: Player? = nil
    @Published var winRatio: WinRatio? = nil
    @Published var playerId = ""
    @Published var newSteamCode = ""
    @Published var newDateAdded = Date()
    
    private var playerDataService: PlayerDataService
    private var playerWinRatioService: PlayerWinRatioService
    private var matchHistoryService: MatchHistoryService
    private var anyCancellables = Set<AnyCancellable>()
    
    init(playerId: String) {
//        self.storage = storage
//        viewContext = storage.container.viewContext
//        storage.fetchFollowedPlayers()
//        self.followedPlayers = storage.followedPlayers
        self.playerId = playerId
        self.playerDataService = PlayerDataService(playerId: playerId)
        self.playerWinRatioService = PlayerWinRatioService(playerId: playerId)
        self.matchHistoryService = MatchHistoryService(playerId: playerId)
        addSubscriber()
    }
    
    func addSubscriber() {
        playerDataService.$player
            .sink { [weak self] (returnedPlayer) in
                self?.player = returnedPlayer
            }
            .store(in: &anyCancellables)
        
        playerWinRatioService.$winRatio
            .sink { [weak self] (returnedWinRatio) in
                self?.winRatio = returnedWinRatio
            }
            .store(in: &anyCancellables)
        
        matchHistoryService.$allMatches
            .sink { [weak self] (returnedMatchHistory) in
                self?.allMatches = returnedMatchHistory
            }
            .store(in: &anyCancellables)
    }
    
//    func addFollowedPlayer() {
//        storage.addFollowedPlayer(steamCode: newSteamCode, dateAdded: newDateAdded)
//        storage.saveData()
//        storage.fetchFollowedPlayers()
//        followedPlayers = storage.followedPlayers
//    }
}
