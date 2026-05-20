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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                LottieView(name: "CongratulationCat")
                    .frame(width: 309, height: 323.02)
                Text("Parabéns!!")
                    .font(Font.title.bold())
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                Text("Sessão concluída com sucesso!")
                    .font(Font.title2)
                    .fontWeight(Font.Weight.medium)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                Spacer(minLength: 180)
            }
            .foregroundColor(.gray.opacity(0.5))
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem (placement: .topBarLeading) {
                Button {
                    isPresented = true
                } label: {
                    Label("Sair", systemImage: "xmark")
                }
                .fullScreenCover(isPresented: $isPresented){
                    ContentView()
                }
            }
        }
    }
}

#Preview {
    CongratulationView()
}
