//
//  DotaOsApp.swift
//  DotaOs
//
//  Created by Bartosz Wojtkowiak on 02/03/2022.
//

import SwiftUI

@main
struct DotaOsApp: App {
    @StateObject private var vm = MatchHistoryViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MatchHistoryView()
            }
            .environmentObject(vm)
        }
    }
}
