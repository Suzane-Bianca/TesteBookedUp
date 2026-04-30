//
//  SectionDetailView.swift
//  TesteBookedUp
//
//  Created by User on 29/04/26.
//

import SwiftUI

struct NoteDetailView: View {
    let newNote: Note
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            if let bookName = newNote.bookName {
                Text(bookName)
            }
            Text(newNote.reactionCat.title)
            Text(newNote.descriptionNote)
        }
    }
}
