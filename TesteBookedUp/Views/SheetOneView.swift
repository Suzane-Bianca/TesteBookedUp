//
//  SheetOneView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import SwiftData



struct SheetOneView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Book.id) private var booksSheet: [Book]
    
    @State private var description: String = ""
    @State private var editingBook: Book? = nil
    @State private var livros = []
    @State private var isPresented: Bool = false
    @State private var reactionEnum: Reaction = .happy
    
    
    var body: some View {
        NavigationStack{
            HStack{
                ForEach (Reaction.allCases, id: \.self){ reaction in
                    Image(reaction.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 63, height: 63)
                        .padding(7)
                }
            }
            
            VStack{
                List{
                    Section {
                        ForEach(booksSheet) { book in
                            BooksDetailView(books: book)
                                .foregroundStyle(.black)
                                .swipeActions{
                                    Button (role: .destructive){
                                        modelContext.delete(book)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                    
                                    Button {
                                        editingBook = book
                                    } label: {
                                        Label ("Edit", systemImage: "pencil")
                                    }
                                    .tint(.blue)
                                    
                                }
                        }
                        .padding(10)
                        .listRowBackground(Color(.purpleList))
                    }
                    Section {
                        Button{
                            isPresented = true
                        }label: {
                            Label("Adicionar título do livro", systemImage: "plus")
                        }
                        .navigationDestination(isPresented: $isPresented){
                            SheetTwoView()
                        }
                    }
                    Section ("Conte-me como foi o livro") {
                        TextField("O livro está sendo...", text: $description)
                    }
                }
                .scrollContentBackground(.hidden)
                .listRowSpacing(10)
            }
            
            .toolbar {
                NavigationLink {
                    
                } label: {
                    Label ("Concluir", systemImage: "checkmark")
                }
            }
            .navigationDestination(item: $editingBook) { book in
                SheetTwoView(editingBook: book)
            }
            
        }
    }
}

#Preview {
    SheetOneView()
}

enum Reaction: String, CaseIterable, Identifiable {
    case happy, sad, angry, boring
    
    var title: String {
        switch self {
        case .happy:
            "Feliz"
        case .sad:
            "Triste"
        case .angry:
            "Raiva"
        case .boring:
            "Tédio"
        }
    }
    
    var image: String {
        switch self {
        case .happy:
            "gatoAlegre"
        case .sad:
            "gatoTriste"
        case .angry:
            "gatoRaiva"
        case .boring:
            "gatoTedio"
        }
            
    }
    var id: Self {
        self
    }
}
