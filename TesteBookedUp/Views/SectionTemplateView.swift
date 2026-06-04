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
    @State private var isSheetCreat: Bool = false
    
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
                    .foregroundColor(Color(.black))
                    .background(Color(.systemBackground))
                    .presentationDetents([.large])
                    .presentationDragIndicator(.visible)
            }
            .navigationTitle("Sessões")
            .toolbar {
                Button {
                    isSheetCreat = true
                } label: {
                    Label ("Adicionar anotação", systemImage: "plus")
                }
                .sheet(isPresented: $isSheetCreat) {
                    CreateSection(sessionTime: 0)
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
