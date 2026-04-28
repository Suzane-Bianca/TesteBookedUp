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
//            Image("Biblioteca")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ForEach(Goal.allCases, id: \.rawValue) { goal in
                    
                    if readingNumber >= goal.rawValue {
                        goal.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                    } else {
                        Image("block")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)


                    }
                }
            }
        }
    }
}

#Preview {
    LibraryView()
}
