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




//ZStack{
////            Image("Library")
////                .resizable()
////                .edgesIgnoringSafeArea(.all)
////                .fixedSize(horizontal: true, vertical: true)
//    
//    Image("Fundo")
////                .resizable()
//        .scaledToFill()
//        .edgesIgnoringSafeArea(.all)
//    
//    VStack{
//        
//
//        
////                .fixedSize(horizontal: false, vertical: true)
////                GridRow {
//        ZStack(alignment: .bottom) {
//            Rectangle()
//                .foregroundStyle(.purplePurple.opacity(0.5))
//                .frame(height: 60)
//            
//            HStack(alignment: .bottom, spacing: 10) {
//                ForEach(Goal.allCases, id: \.rawValue) { goal in
//                    
//                    if readingNumber >= goal.rawValue {
//                        VStack {
//                            goal.image
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 53)
//                            
//                            Text("texto")
//                                .padding(.bottom)
//                        }
//                    } else {
//                        Image("block")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 100)
//                        
//                        
//                    }
//                }
//            }
//            
//
//        }
//        
//        HStack(alignment: .bottom, spacing: 10) {
//            ForEach(Goal.allCases, id: \.rawValue) { goal in
//                
//                if readingNumber >= goal.rawValue {
//                    goal.image
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 53)
//                } else {
//                    Image("block")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100)
//                    
//                    
//                }
//            }
//        }
//        }
////            }
//}
