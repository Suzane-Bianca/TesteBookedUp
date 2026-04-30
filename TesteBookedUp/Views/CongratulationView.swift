//
//  CongratulationView.swift
//  TesteBookedUp
//
//  Created by User on 29/04/26.
//

import SwiftUI
import Lottie

struct CongratulationView: View {
    @State private var isPresented: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                LottieView(name: "CongratulationCat")
                    .frame(width: 309, height: 323.02)
                Text("Parabéns!!")
                    .font(Font.title.bold())
                Text("Sessão concluída com sucesso!")
                    .font(Font.title2)
                Spacer(minLength: 180)
            }
            .foregroundColor(.black)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem (placement: .topBarLeading) {
                Button {
                    dismiss()
                    dismiss()
                } label: {
                    Label("Sair", systemImage: "xmark")
                }
            }
        }
    }
}

#Preview {
    CongratulationView()
}
