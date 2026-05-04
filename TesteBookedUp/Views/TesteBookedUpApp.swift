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
    @State var progressViewModel = ProgressViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(progressViewModel)
        }
        .modelContainer(for: [Book.self, Note.self])
    }
}
