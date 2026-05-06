//
//  NotesView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import SwiftData

struct SectionTemplatView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort:\Note.id, order: .reverse) private var notes: [Note]
    
    @State private var selected: Note?
    
    var body: some View {
        NavigationStack{
            List(notes) { nota in
                Button {
                    selected = nota
                } label: {
                    NoteDetailView(newNote: nota)
                }
                .swipeActions{
                    Button (role: .destructive){
                        modelContext.delete(nota)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .sheet(item: $selected){ nota in
                CardTemplatView(notes: nota)
                    .background(Color(.systemBackground))
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            }
            .navigationTitle("Sessões")
            .toolbar {
                NavigationLink {
                    SheetOneView(sessionTime: 0)
                } label: {
                    Label ("Adicionar anotação", systemImage: "plus")
                }
            }
            
        }
        
        .listRowSpacing(10)
        .onAppear {
            print(notes)
            
        }
        .background(Color.red)
    }
}

#Preview {
    @Previewable @State var progressViewModel = ProgressViewModel()
    
    SectionTemplatView()
        .environment(progressViewModel)
}
