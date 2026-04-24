//
//  LibraryView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import SwiftData

struct LibraryView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var booksSheet: [Book]
    
    var body: some View {

    }
}

#Preview {
    LibraryView()
}
