//
//  BooksDetailView.swift
//  TesteBookedUp
//
//  Created by User on 24/04/26.
//

import SwiftUI

struct BooksDetailView: View {
    let books: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(books.nome)
                .font(.body)
        }
    }
}
