//
//  ContentView.swift
//  TesteBookedUp
//
//  Created by User on 16/04/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") private var selectedTab = 0
    
    var body: some View {
        TabView (selection: $selectedTab){
            Tab("Sala", systemImage: "house", value: 0){
                HomeView()
            }
            
            Tab("Biblioteca", systemImage: "books.vertical", value: 0){
                LibraryView()
            }
            
            Tab("Diário", systemImage: "book", value: 0){
                NotesView()
            }
        }
    }
}

#Preview {
    ContentView()
}
