//
//  LibraryView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import SwiftData


//grid


//duas Hstack dentro duma VStack

struct LibraryView: View {
    var readingNumber = 150
    
    @Query private var booksSheet: [Book]
    
    var body: some View {
        ZStack{
            Image("Biblioteca")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                
                    Text("Library")
                        .font(.largeTitle)
                        .bold()
                    Spacer()}
            }
  
                .padding()      }
    }
    
}

#Preview {
    LibraryView()
}
