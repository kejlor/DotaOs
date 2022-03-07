//
//  DotaOsApp.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 02/03/2022.
//

import SwiftUI

@main
struct DotaOsApp: App {
    @StateObject private var vm = PlayerViewModel(playerId: "58317096")
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PlayerView(player: Player(id: "321", profile: Profile(accountId: 58317096, personName: "Kejlor", avatarFull: "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/4e/4e7c8ce7abb06b6e5c6b39248878cbeaed821cb9_full.jpg", profileURL: "https://steamcommunity.com/profiles/76561198018582824/", locCountryCode: "PL")))
            }
            .environmentObject(vm)
        }
    }
}
