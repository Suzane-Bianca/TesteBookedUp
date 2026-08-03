//
//  GeometryReader.swift
//  TesteBookedUp
//
//  Created by User on 30/04/26.
//

import SwiftUI

enum GoalStatus {
    case completed
    case current(progress: Int, target: Int)
    case locked
}

extension Goal{
    static func previous(before goal: Goal) -> Goal? {
        guard let index = Goal.allCases.firstIndex(of: goal), index > 0 else {
            return nil
        }
        return Goal.allCases[index - 1]
    }
    
    func status(totalProgress: Int) -> GoalStatus {
        let previousThreshold = Goal.previous(before: self)?.unlockProgress ?? 0
        if totalProgress >= self.unlockProgress {
            return .completed
        } else if totalProgress >= previousThreshold {
            return .current(progress: totalProgress - previousThreshold, target: self.unlockProgress - previousThreshold)
        } else {
            return .locked
        }
    }
}

struct GoalView: View {
    @AppStorage(AppStorageKeys.totalProgress.rawValue) var totalProgress = 0

    let goal: Goal

    
    var body: some View {
        VStack(spacing: 0) {
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
}

struct ShelfStatusBar: View {
    @AppStorage(AppStorageKeys.totalProgress.rawValue) var totalProgress = 0
    
    let goals: [Goal]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(goals, id: \.self) { goal in
                Group {
                    switch goal.status(totalProgress: totalProgress) {
                    case .completed:
                        Text("Concluído")
                    case .current(progress: let progress, target: let target):
                        Text("\(progress)/\(target)")
                    case .locked:
                        Text("")
                    }
                }
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.darkPurple)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical)
        .background(.prateleira)
        .cornerRadius(8)
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
                    ShelfStatusBar(goals: [.first, .sec, .third])
//                        .padding(.top)
//                    Image("Prateleira")
//                        .resizable()
//                        .scaledToFit()
                    
                }
    
                .padding(.horizontal) //20
                .padding(.vertical) //10
                
                VStack(spacing: 0) {
                    HStack(alignment: .bottom, spacing: 50) {
                        GoalView(goal: .fourth)
                        GoalView(goal: .fifth)
                        GoalView(goal: .sixth)
                    }
                
                    ShelfStatusBar(goals: [.fourth, .fifth, .sixth])
//                        .padding(.top)
//                    Image("Prateleira")
//                        .resizable()
//                        .scaledToFit()
                    
                }
                .padding(.vertical) //40
                .padding(.horizontal)// 20
                
                Image("TopoDaEstante")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(Angle(degrees: 180))
                    .padding(.bottom)
            }
            .padding()
        }
        .padding(.vertical)
//        .ignoresSafeArea()
        .background(Image("Fundo"))
    }
}

#Preview {
    GeometryReader()
}
