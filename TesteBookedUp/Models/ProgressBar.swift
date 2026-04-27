//
//  ProgressBar.swift
//  TesteBookedUp
//
//  Created by User on 24/04/26.
//

import SwiftUI

struct ProgressBar: View {
    @Environment(ProgressViewModel.self) private var progressViewModel: ProgressViewModel
    
    @State private var speed = 0.5

    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 69
    
    var body: some View {
//        VStack{
//            Gauge(value: 32, in: 0...50){
//                Text("Speed")
//            } currentValueLabel: {
//                Text(Int(speed), format: .number)
//                    .foregroundColor(Color.gray)
//            } minimumValueLabel: {
//                Text("0")
//            }maximumValueLabel: {
//                Text("50")
//            }
//            .tint(Color("ProgressBar"))
//            .gaugeStyle(.linearCapacity)
//            .padding(50)
//        }
        
        
        
        
        let multipler = width / 150
        
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: width, height: height)
                .foregroundStyle(Color.gray.opacity(0.1))
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: percent * multipler, height: height)
                .foregroundStyle(Color("ProgressBar"))
                
        }
    }
}

#Preview {
    @Previewable @State var progressViewModel = ProgressViewModel()
    
    ProgressBar()
        .environment(progressViewModel)
}
