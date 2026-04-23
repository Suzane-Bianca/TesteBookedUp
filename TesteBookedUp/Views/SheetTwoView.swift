//
//  SheetTwoView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import SwiftData

class BookName: Identifiable {
    var id = UUID()
    var nome: String
    
    init (nome: String){
        self.nome = nome
    }
}

struct SheetTwoView: View {
    @State private var bookname: [BookName]
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            TextField("Nome do livro", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button{
                self.bookname.append(BookName(nome: self.name))
                self.name = ""
            } label: {
//                Label (Text("Adicionar"), systemImage: "plus")
            }
        }
    }
}

//#Preview {
//    SheetTwoView()
//}
