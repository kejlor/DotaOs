//
//  PreviewProvider+Ext.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 06/03/2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    
    let match = Match(matchId: 01, duration: 2270, heroId: 91, kills: 10, deaths: 0, assists: 10)
    
    let player = Player(id: "321", profile: Profile(accountId: 58317096, personName: "Kejlor", avatarFull: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/4e/4e7c8ce7abb06b6e5c6b39248878cbeaed821cb9_full.jpg", profileURL: "https://steamcommunity.com/profiles/76561198018582824/", locCountryCode: "PL"))
}
