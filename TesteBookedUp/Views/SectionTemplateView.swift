//
//  NotesView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import SwiftData

struct SectionTemplatView: View {
    @Query private var notes: [Note]
    
    var body: some View {
        NavigationStack{
            List(notes) { nota in
                NoteDetailView(newNote: nota)
            }
            .navigationTitle("Sessões")
            .toolbar {
                NavigationLink {
                    SheetOneView()
                } label: {
                    Label ("Adicionar anotação", systemImage: "plus")
                }
            }
        }
        .listRowSpacing(10)
        .onAppear {
            print(notes)
        }
    }
}
