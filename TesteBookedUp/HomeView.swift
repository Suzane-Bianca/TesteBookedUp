//
//  HomeView.swift
//  TesteBookedUp
//
//  Created by User on 17/04/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresented: Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.lightPurple)
                    .ignoresSafeArea()
                
                VStack{
                    Text("Seu progresso atual!")
                        .font(Font.title.bold())
                        .foregroundColor(Color(hex: 0x6155f5))
                    
                    Button ("Iniciar sessão de leitura"){
                        isPresented = true
                    }
                    .bold()
                    .foregroundColor(.white)
                    .padding([.bottom, .top], 14)
                    .padding([.leading, .trailing], 20)
                    .background(Color(hex: 0x6155f5))
                    .cornerRadius(45)
                    .navigationDestination(isPresented: $isPresented){
                        TimerView()
                    }
                }
                .padding(50)
                .background(.white)
                .cornerRadius(45)
            }
        }
    }
}

#Preview {
    HomeView()
}
