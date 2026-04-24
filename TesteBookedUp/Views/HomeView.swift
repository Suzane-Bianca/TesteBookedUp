//
//  HomeView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @State private var isPresented: Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.lightPurple)
                    .ignoresSafeArea()
                Image("TelaInicial")
                
                Spacer()
                
                VStack {
                    LottieView(name: "AnimacaoTelaInicial")
                        .frame(width: 270, height: 280)
                        
                    VStack{
                        Text("Seu progresso atual")
                            .font(Font.title3.bold())
                            .foregroundColor(Color .darkPurple)
                        VStack {
                            ProgressBar(width: 250, height: 20, percent:100)
                        }
                        .padding(.all, 10)
                        
                        Button{
                            isPresented = true
                        } label: {
                            Label("Iniciar sessão de leitura", systemImage: "book.fill")
                                .bold()
                                .foregroundColor(.white)
                                .padding([.bottom, .top], 14)
                                .padding([.leading, .trailing], 20)
                                .background(Color .purplePurple)
                                .cornerRadius(45)
                                .navigationDestination(isPresented: $isPresented){
                                    TimerView()
                                }
                        }
                    }
                    
                    .padding(50)
                    .background(.white)
                    .cornerRadius(45)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
