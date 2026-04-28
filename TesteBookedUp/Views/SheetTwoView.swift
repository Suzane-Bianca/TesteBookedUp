//
//  SheetTwoView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import SwiftData

struct SheetTwoView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var book: [Book]
    
    @State private var name: String = ""
    var editingBook: Book?
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        
        NavigationStack {
            VStack {
                Form{
                    TextField("Nome do livro", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(10)
                }
                Spacer()
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Confirmar", systemImage: "checkmark"){
                        let NewBook = newBook(nome: name)
                        if editingBook != nil {
                            editingBook?.nome = name
                            dismiss()
                        }
                        else {
                            modelContext.insert(NewBook)
                            dismiss()
                        }
                    }
                    .disabled(name.isEmpty)
                }
            }
            .onAppear {
                if let editingBook = editingBook {
                    name = editingBook.nome
                }
            }
        }
    }
    
}

#Preview {
    SheetTwoView(editingBook: nil)
}

func newBook (nome: String) -> Book {
    let NewBook = Book(nome: nome)
    return NewBook
}
