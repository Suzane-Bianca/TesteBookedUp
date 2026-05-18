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
            Spacer()
            Image("book")
            Spacer()
            VStack (alignment: .leading){
                Text("Qual título do livro?")
                    .foregroundColor(.black)
                    .padding([.leading], 20)
                    .bold()
                TextField("O Mistérioso caso do Gato Mago", text: $name, axis: .vertical)
                    .multilineTextAlignment(TextAlignment.leading)
                    .lineLimit(8...)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(1)
                    .scrollContentBackground(.hidden)
                    .padding([.leading, .trailing], 20)
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Text("Adicionar livro")
                        .foregroundColor(.black)
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Confirmar", systemImage: "checkmark"){
                        let NewBook = Book(nome: name)
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
