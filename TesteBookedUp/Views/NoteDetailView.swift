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
        VStack (alignment: .leading){
            HStack {
                Image(newNote.reactionCat.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 62.72)
                if let bookName = newNote.bookName {
                    Text(bookName)
                        .bold()
                        .foregroundColor(Color.darkPurple)
                }
                Spacer()
            }
            Text(newNote.descriptionNote)
        }
    }
}
