//
//  Timer.swift
//  TesteBookedUp
//
//  Created by User on 16/04/26.
//

import SwiftUI
import Lottie
import Combine

var timer: Timer = Timer()

struct TimerView: View {
    @State private var showingAlert: Bool = false
    
    @State var timeText: String = "00 : 00 : 00"
    @State var counter:Int = 0
    @State var isTimerRunning:Bool = false
    @State private var toSheet: Bool = false

    var body: some View {
        
        NavigationStack {
            ZStack{
                Color(.lightPurple)
                    .ignoresSafeArea()
                
                VStack (alignment: .center) {
                    
                    Spacer()
                    
                    Text(timeText)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.purplePurple)
                        .padding([.bottom, .top], 12)
                        .padding([.leading, .trailing], 50)
                        .background(.white)
                        .cornerRadius(22.5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22.5)
                                .stroke(style: StrokeStyle(lineWidth: 3))
                        )
                        .foregroundColor(.purplePurple)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    LottieView(name: "Lendo Gato Magico - Meta 1")
                        .frame(width: 225.77, height: 250)
                    
                    
                    Spacer()
                    Text("Vamos ler?")
                        .bold()
                        .font(Font.title)
                        .foregroundStyle(Color(.darkPurple))
                    
                    if (isTimerRunning) {
                        Button{
                            if (isTimerRunning) {
                                isTimerRunning = false
                                timer.invalidate()
                            }
                        } label: {
                            Label("Pausar", systemImage: "pause")
                                .foregroundColor(.purplePurple)
                                .font(Font.title2)
                                .padding([.bottom, .top], 10)
                                .padding([.leading, .trailing], 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 45)
                                        .stroke(style: StrokeStyle(lineWidth: 3))
                                )
                        }
                    } else {
                        Button{
                            if (isTimerRunning == false) {
                                isTimerRunning = true
                                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: (timerCounter))
                            }
                        } label: {
                            Label("Começar", systemImage: "play")
                                .foregroundColor(.purplePurple)
                                .font(Font.title2)
                                .padding([.bottom, .top], 10)
                                .padding([.leading, .trailing], 40)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 45)
                                        .stroke(style: StrokeStyle(lineWidth: 3))
                                )
                        }
                        
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Button {
                        showingAlert = true
                    } label: {
                        Label("Concluir sessão", systemImage: "")
                            .font(Font.title3.bold())
                            .foregroundColor(.white)
                            .font(Font.title2)
                            .padding([.bottom, .top], 14)
                            .padding([.leading, .trailing], 70)
                            .background(Color .purplePurple)
                            .cornerRadius(45)
                            .alert("Finalizar sessão?", isPresented: $showingAlert){
                                Button("Cancelar") {
                                }
                                Button ("Concluir"){
                                    toSheet = true
                                    if (toSheet) {
                                        isTimerRunning = false
                                        timer.invalidate()
                                    }
                                }
                                .keyboardShortcut(.defaultAction)
                            } message: {
                                Text("Salvar essa sessão de leitura registrará seu progresso.")
                            }
                            .sheet(isPresented: $toSheet){
                                SheetOneView()
                                    .background(Color(.systemBackground))
                                    .presentationDragIndicator(.visible)
                            }
                    }
                }
            }
        }
        .toolbarVisibility(.hidden, for: .tabBar)
    }
    
    func timerCounter(_ timer: Timer) {
        counter += 1
        let time = secondsToHoursMinutesSeconds(seconds: counter)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeText = timeString
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        return String(format: "%02d : %02d : %02d", hours, minutes, seconds)
    }

    func secondsToHoursMinutesSeconds (seconds: Int) -> (Int, Int, Int) {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds.remainderReportingOverflow(dividingBy: 60).partialValue
        return (hours, minutes, seconds)
    }
}

#Preview {
    TimerView()
}

//force unwrap -> !
// nil coalescing -> ??
//optional binding -> if let


