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
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancelar", systemImage: "xmark"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("Confirmar", systemImage: "checkmark"){
                        let NewBook = Book(nome: name)
                        modelContext.insert(NewBook)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
    
}

#Preview {
    SheetTwoView()
}
