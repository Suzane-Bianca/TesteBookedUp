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
    
    @AppStorage("totalProgress") var totalProgress = 0


    
    @State var progressViewModel = ProgressViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(progressViewModel)
                .onChange(of: totalProgress) {
                    progressViewModel.progress = totalProgress
                    
                }
        }
//        .modelContainer(for: ProgressInGoal.self)
    }
}
