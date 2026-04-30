//
//  GeometryReader.swift
//  TesteBookedUp
//
//  Created by User on 30/04/26.
//

import SwiftUI

struct GoalView: View {
    
    @AppStorage("totalProgress") var totalProgress = 700
    
    let goal: Goal
    
    var body: some View {
        if totalProgress >= goal.unlockProgress {
            goal.image
                .resizable()
                .scaledToFit()
        } else {
            Image("Block")
                .resizable()
                .scaledToFit()
        }
       
    }
    
    
//    func progress() -> Double {
//        goal.rawValue
//    }
    
}

struct GeometryReader: View {
    var body: some View {
        ZStack{
            
            VStack(alignment:.center) {
                Image("TopoDaEstante")
                    .resizable()
                    .scaledToFit()
                    .overlay(Text("Biblioteca Mágica")
                        .bold())
                
                VStack(spacing: 0) {
                    HStack(alignment: .bottom, spacing: 50) {
                        GoalView(goal: .first)
                        GoalView(goal: .sec)
                        GoalView(goal: .third)
                    }
                    .padding(.horizontal)
                    Image("Prateleira")
                        .resizable()
                        .scaledToFit()
                    
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 50)
                
                VStack(spacing: 0) {
                    HStack(alignment: .bottom, spacing: 50) {
                        GoalView(goal: .fourth)
                        GoalView(goal: .fifth)
                        GoalView(goal: .sixth)
                    }
                    .padding(.horizontal)
                    
                    Image("Prateleira")
                        .resizable()
                        .scaledToFit()
                    
                }
                .padding(.vertical, 40)
                .padding(.horizontal, 20)
                
                Image("TopoDaEstante")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 180))
            }
            .padding()
        }
        .ignoresSafeArea()
        .background(Image("Fundo"))
    }
}

#Preview {
    GeometryReader()
}
