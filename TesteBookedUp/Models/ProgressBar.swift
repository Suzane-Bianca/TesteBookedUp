//
//  ProgressBar.swift
//  TesteBookedUp
//
//  Created by User on 24/04/26.
//

import SwiftUI
import SwiftData

struct ProgressBar: View {
        
    @Environment(ProgressViewModel.self) private var progressViewModel: ProgressViewModel
    @AppStorage("totalProgress") var totalProgress = 0
    
    @State private var speed = 0.5

    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 69

    
    var body: some View {
        let multipler = width / 150
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: width, height: height)
                .foregroundStyle(Color.gray.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
//                .frame(width: CGFloat(progressViewModel.progress) * multipler, height: height)
                .frame(width: CGFloat(CFloat(progressViewModel.updateProgress(with: progressViewModel.progress, totalProgress: totalProgress))) * multipler, height: height)
                .foregroundStyle(Color("ProgressBar"))
                
        }
    }
}
//
//#Preview {
//    @Previewable @State var progressViewModel = ProgressViewModel(progress: <#ProgressInGoal#>)
//    
//    ProgressBar()
//        .environment(progressViewModel)
//}
