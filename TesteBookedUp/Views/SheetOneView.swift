//
//  SheetOneView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import SwiftData

struct SheetOneView: View {
    let allBook: Book
    
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = "Red"
    @State private var livros = []
    @State private var isPresented: Bool = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Picker("Please choose a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Spacer()
                
                VStack(alignment: .leading, spacing: 10){
                    
                    List {
                        Text(allBook.nome)
                    }
                    
                    Button{
                        isPresented = true
                    }label: {
                        Label("Adicionar título do livro", systemImage: "plus")
                    }
                    .navigationDestination(isPresented: $isPresented){
                        SheetTwoView()
                    }
                }
            }
            
            .toolbar {
                NavigationLink {
                    
                } label: {
                    Label ("Concluir", systemImage: "checkmark")
                }
            }
        }
    }
}

#Preview {
//    SheetOneView(allBook: Book)
}
