////
////  Teste.swift
////  TesteBookedUp
////
////  Created by User on 27/04/26.
////
//
//// Source - https://stackoverflow.com/q/64483674
//// Posted by beazer
//// Retrieved 2026-04-27, License - CC BY-SA 4.0
//
//import SwiftUI
//import Combine
//
//class ScoreCounter: ObservableObject {
//    @Published var redCounter: Int = 0
//    //var yellowCounter: Int = 0
//    //var greenCounter: Int = 0
//    //var blueCounter: Int = 0
//}
//
//struct ContentView: View {
//       
//    var body: some View {
//        
//        //MARK - Red Button Stack
//        
//        HStack {
//            
//            NumberView(currentImage: "2red", imageName: "2red", xImageName: "2Xred")
//            NumberView(currentImage: "3red", imageName: "3red", xImageName: "3Xred")
//            
//        }
//    }
//}
//
//
//struct NumberView: View {
//    
//    @EnvironmentObject var redScoreCounter: ScoreCounter
//    @State var currentImage: String
//    @State var imageName: String
//    @State var xImageName: String
//    
//    var body: some View {
//        Button(action: {
//            self.currentImage = self.currentImage == imageName ? xImageName : imageName
//
//            if currentImage == xImageName {
//                ScoreCounter.redScoreCounter += 1
//            } else {
//                ScoreCounter.redScoreCounter -= 1
//            }
//            print(ScoreCounter.redScoreCounter)
//            
//        }) {
//            Image(currentImage)
//        }
//
//    }
//}
//
//
//#Preview {
//    ContentView()
//}
