//
//  CardTemplatView.swift
//  TesteBookedUp
//
//  Created by User on 06/05/26.
//

import SwiftUI
import SwiftData

struct CardTemplatView: View {
    @State var selectedReaction: Reaction?
    @State var isEditing: Bool = false
    
    let notes: Note
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                List{
                    Section ("Tempo lido:"){
                        Text("\(notes.duration) minuto(s)")
                    }
                    Section ("Como você se sentiu?"){
                        HStack{
                            ForEach (Reaction.allCases, id: \.self) { reaction in
                                if notes.reactionCat == reaction {
                                    ZStack {
                                        VStack {
                                            Image(reaction.image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 76, height: 76)
                                                .padding([.leading, .trailing], 3)
                                            Text(reaction.title)
                                                .font(Font.body.bold())
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
                                            .frame(width: 76, height: 76)
                                            .padding([.leading, .trailing], 3)
                                        Text(reaction.title)
                                            .padding([.bottom], 9)
                                            .foregroundColor(.black)
                                            .font(Font.body)
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(style: StrokeStyle(lineWidth: 1))
                                    )
                                }
                            }
                        }
                    }
                    .headerProminence(.increased)
                    
                    Section {
                        VStack {
                            Text ("\(Image(systemName: "book.closed"))   \(notes.bookName!)")
                                .font(Font.title2)
                                .foregroundStyle(Color (.purplePurple))
                                .padding(10)

                        }
                    } header: {
                        Text("Qual livro você estava lendo?")
                    }
                    .headerProminence(.increased)
                    .listRowBackground(Color(.purpleList))
                    
                    Section ("Suas anotações do livro:"){
                        Text(notes.descriptionNote)
                            .padding(10)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .font(Font.body)
                            .foregroundColor(.black)
                            .lineLimit(8...)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }
                    .headerProminence(.increased)
                }
                .scrollContentBackground(.hidden)
                .listRowSpacing(10)
                .navigationBarTitle(notes.bookName!, displayMode: .inline)
            }
            .toolbar {
                Button {
                    isEditing = true
                } label: {
                    Label ("Concluir", systemImage: "square.and.pencil")
                        .navigationDestination(isPresented: $isEditing) {
                            SectionEditView(isEditing: notes)
                        }
                }
            }
        }
    }
}
