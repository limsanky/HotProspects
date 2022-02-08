//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Sankarshana V on 2022/02/08.
//

import SwiftUI

@main
struct HotProspectsApp: App {
    @StateObject private var prospects = Prospects()
    
    var body: some Scene {
        WindowGroup {
            ContentView(prospects: prospects)
        }
    }
}
