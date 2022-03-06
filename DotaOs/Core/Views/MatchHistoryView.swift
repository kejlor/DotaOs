//
//  MatchHistoryView.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 06/03/2022.
//

import SwiftUI

struct MatchHistoryView: View {
    @EnvironmentObject private var vm: MatchHistoryViewModel
    var body: some View {
        allMatches
    }
}

struct MatchHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        MatchHistoryView()
    }
}

extension MatchHistoryView {
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
