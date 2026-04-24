//
//  TesteBookedUpApp.swift
//  TesteBookedUp
//
//  Created by User on 16/04/26.
//

import SwiftUI
import SwiftData

@main
struct TesteBookedUpApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        .modelContainer(for: [Book.self])
    }
}
