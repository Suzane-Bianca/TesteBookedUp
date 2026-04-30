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
    @Environment(\.dismiss) var dismiss
    
    @Query(sort: \Book.id, order: .reverse) private var booksSheet: [Book]
    @Query private var notes: [Note]
    
    @State private var description: String = ""
    @State private var editingBook: Book? = nil
    @State private var isPresented: Bool = false
    @State private var isCongratulations: Bool = false
    
    @State private var saveNotes: Note? = nil
    
    @State var selectedReaction: Reaction?
    @State var selectedBook: Book?

    let defaultReaction: Reaction = .happy
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section ("Como você se sentiu?"){
                        HStack{
                            ForEach (Reaction.allCases, id: \.self) { reaction in
                                Button {
                                    selectedReaction = reaction
                                } label: {
                                    if selectedReaction == reaction {
                                        ZStack {
                                            VStack {
                                                Image(reaction.image)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 80, height: 80)
                                                    .padding([.leading, .trailing], 3)
                                                Text(reaction.title)
                                                    .font(Font.title2.bold())
                                                    .padding([.bottom], 9)
                                                    .foregroundColor(.black)
                                            }
                                            .background(Color .purpleSelected)
                                            .cornerRadius(16)
                                        }
                                    } else {
                                        VStack {
                                            Image(reaction.image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80, height: 80)
                                                .padding([.leading, .trailing], 3)
                                            Text(reaction.title)
                                                .padding([.bottom], 9)
                                                .foregroundColor(.black)
                                                .font(Font.title2)
                                        }
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(style: StrokeStyle(lineWidth: 1))
                                        )
                                    }
                                }
                                .buttonStyle(.borderless)
                            }
                        }
                    }
                    .headerProminence(.increased)
                    .listSectionMargins([.trailing, .leading], 6)
                    Section ("Qual livro você leu hoje?"){
                        ForEach(booksSheet) { book in
                            Button {
                                selectedBook = book
                            } label: {
                                if selectedBook == book {
                                    HStack{
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(Font.title2)
                                            .padding([.trailing], 8)
                                        BooksDetailView(books: book)
                                            .foregroundStyle(.black)
                                    }
                                } else {
                                    HStack{
                                        Image(systemName: "circle")
                                            .font(Font.title2)
                                            .padding([.trailing], 8)
                                        BooksDetailView(books: book)
                                            .foregroundStyle(.black)
                                    }
                                }
                            }
                            
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
                        .listSectionMargins([.top], 20)
                    }
                    .headerProminence(.increased)
                    Section ("Seu livro não está na lista?"){
                        Button{
                            isPresented = true
                        }label: {
                            HStack  {
                                Text("Adicionar título do livro")
                                Spacer()
                                Image(systemName: "plus")
                            }
                            .foregroundColor(.white)
                            .bold()
                        }
                        .padding(10)
                        .listRowBackground(Color(.purplePurple))
                        .navigationDestination(isPresented: $isPresented){
                            SheetTwoView()
                        }
                    }
                    
                    Section ("Conte-me como foi o livro") {
                        TextField("O livro está sendo...", text: $description, axis: .vertical)
                            .lineLimit(8...)
                            .multilineTextAlignment(.leading)
                            .textFieldStyle(.roundedBorder)
                    }
                    .headerProminence(.increased)
                }
                .scrollContentBackground(.hidden)
                .listRowSpacing(10)
                .navigationBarTitle("Anotações", displayMode: .inline)

            }
            
            
            .toolbar {
                ToolbarItem(placement: .confirmationAction){
                    Button {
                        let newNote = Note(bookName: selectedBook?.nome, reactionCat: selectedReaction ?? defaultReaction, descriptionNote: description)
                        modelContext.insert(newNote)
                        isCongratulations = true
                    } label: {
                        Label ("Concluir", systemImage: "checkmark")
                            .navigationDestination(isPresented: $isCongratulations){
                                CongratulationView()
                            }
                    }
                    .disabled((selectedBook == nil))
                    
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



enum Reaction: String, CaseIterable, Identifiable, Hashable, Codable, Equatable {
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
    var id: String {
        self.rawValue
    }
}
