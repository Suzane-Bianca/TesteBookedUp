//
//  Note.swift
//  TesteBookedUp
//
//  Created by User on 29/04/26.
//

import SwiftUI
import SwiftData

@Model
class Note: Identifiable, Hashable{
    var id = UUID()
    var bookName: Book
    var reactionCat: Reaction
    var descriptionNote: String
    
    init(bookName: Book, reactionCat: Reaction, descriptionNote: String) {
        self.bookName = bookName
        self.reactionCat = reactionCat
        self.descriptionNote = descriptionNote
    }
}
