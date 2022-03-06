//
//  MatchHistoryViewModel.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 06/03/2022.
//

import Foundation
import Combine

class MatchHistoryViewModel: ObservableObject {
    @Published var allMatches: [Match] = []
    
    private var matchHistoryService = MatchHistoryService()
    private var anyCancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber() {
        matchHistoryService.$allMatches
            .sink { [weak self] (returnedMatchHistory) in
                self?.allMatches = returnedMatchHistory
            }
            .store(in: &anyCancellables)
    }
}
