//
//  PlayerView.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 07/03/2022.
//

import SwiftUI

struct PlayerView: View {
    @EnvironmentObject private var vm: PlayerViewModel
    
    let player: Player
    
    var body: some View {
        VStack {
            playerProfile
            allMatches
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: dev.player)
    }
}

extension PlayerView {
    private var playerProfile: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: player.profile.avatarFull)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 124, height: 124)
                Text(player.profile.personName)
                Text(player.profile.locCountryCode)
                Link(destination: URL(string: player.profile.profileURL)!) {
                    Text("Steam profile")
                }
            }
        }
    }
    
    private var allMatches: some View {
        List {
            ForEach(vm.allMatches) { match in
                matchEntryView(match: match)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    func matchEntryView(match: Match) -> some View {
        return HStack {
            Text("\(match.heroId)")
            Text("\(match.duration / 60)")
            HStack {
                Text("K: \(match.kills)")
                Text("D: \(match.deaths)")
                Text("A: \(match.assists)")
            }
        }
    }
}
