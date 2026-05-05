//
//  HomeView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI
import Lottie

struct HomeView: View {
    @Environment(ProgressViewModel.self) private var progressViewModel: ProgressViewModel
    
    @State private var userGoal: Goal = .sec
    
    @AppStorage("totalProgress") var totalProgress = 0
    
    @State private var isPresented: Bool = false
    var aaa : Goal = .first
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                Color(.lightPurple)
                    .ignoresSafeArea()
                Image("TelaInicial")
                
                Spacer()
                VStack {
                    Text("Você leu \(progressViewModel.VisuProgress(with: progressViewModel.progress, totalProgress: totalProgress )) minutos")
//                    Text("Você leu \(progressViewModel.progress) minutos")
                        .font(Font.title.bold())
                        .padding(10)
                        .foregroundColor(Color .black)
                    
                    
                    LottieView(name: "AnimacaoTelaInicial")
                        .frame(width: 270, height: 280)
                
                    VStack{
                        Text("Seu progresso atual")
                            .font(Font.title.bold())
                            .foregroundColor(Color .darkPurple)
                        VStack {
                            ProgressBar(width: 260, height: 20, percent: CGFloat(progressViewModel.VisuProgress(with: progressViewModel.progress, totalProgress: totalProgress )))
                                .padding(.vertical, 4)
                            Text("\(progressViewModel.VisuProgress(with: progressViewModel.progress, totalProgress: totalProgress )) / \(progressViewModel.updateProgres(with: progressViewModel.progressWork, totalProgress: totalProgress )) minutos")
                                .fontWeight(Font.Weight.semibold)
                                .frame(maxWidth: 260, alignment: .trailing)
                                .padding(.bottom, 24)
                        }
                        .padding(.all, 2)
                        
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
    @Previewable @State var progressViewModel = ProgressViewModel()
    
    HomeView()
        .environment(progressViewModel)

}
