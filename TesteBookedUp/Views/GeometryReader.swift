//
//  GeometryReader.swift
//  TesteBookedUp
//
//  Created by User on 30/04/26.
//

import SwiftUI

struct GoalView: View {
    
//    @Environment(ProgressViewModel.self) private var progressViewModel: ProgressViewModel
    @AppStorage(AppStorageKeys.totalProgress.rawValue) var totalProgress = 0
    
//    @ObservationIgnored @AppStorage("progress") var progress: Int = 0
    
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
    
}

struct GeometryReader: View {
    var body: some View {
        ZStack{
            
            VStack(alignment:.center) {
                Image("TopoDaEstante")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom)
                    .overlay(Text("Biblioteca Mágica")
                        .padding(.leading, 5)
                        .padding(.bottom, 32)
                        .foregroundColor(Color(.black))
                        .font(Font.title2)
                        .fontWeight(Font.Weight.semibold))
                    

                
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
                .padding(.vertical, 10) //50 e estava commitado
                
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
                    .padding(.bottom)
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
