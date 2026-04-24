//
//  ProgressBar.swift
//  TesteBookedUp
//
//  Created by User on 24/04/26.
//

import SwiftUI

struct ProgressBar: View {
    
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
                .frame(width: percent * multipler, height: height)
                .foregroundStyle(Color("ProgressBar"))
                
        }
    }
}

#Preview {
    ProgressBar()
}
