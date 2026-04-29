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
            Text(newNote.bookName.nome)
            Text(newNote.reactionCat.title)
            Text(newNote.descriptionNote)
        }
    }
}
