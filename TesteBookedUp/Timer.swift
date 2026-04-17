//
//  Timer.swift
//  TesteBookedUp
//
//  Created by User on 16/04/26.
//

import SwiftUI
import Combine

var timer: Timer = Timer()

struct TimerView: View {
    @State var timeText: String = "00:00:00"
    @State var counter:Int = 0
    @State var isTimerRunning:Bool = false

    var body: some View {
        ZStack{
            Color(.lightPurple)
                .ignoresSafeArea()
            
            VStack {
                Text("Vamos ler!")
                    .bold()
                    .font(Font.title)
                
                Text(timeText)
                    .font(.largeTitle)
                
                Button{
                    if (isTimerRunning) {
                        isTimerRunning = false
                        timer.invalidate()
                    }
                } label: {
                    Label("Pause", systemImage: "pause.fill")
                }
                .bold()
                .foregroundColor(.white)
                .font(Font.title)
                .padding([.bottom, .top], 10)
                .padding([.leading, .trailing], 40)
                .background(Color(hex: 0x6155f5))
                .cornerRadius(45)
                
                Button{
                    if (isTimerRunning == false) {
                        isTimerRunning = true
                        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: (timerCounter))
                        
                    
                    }
                } label: {
                    Label("Resume", systemImage: "play.fill")
                }
                .bold()
                .foregroundColor(.white)
                .font(Font.title)
                .padding([.bottom, .top], 10)
                .padding([.leading, .trailing], 40)
                .background(Color(hex: 0x6155f5))
                .cornerRadius(45)
            }
        }
    }
    
    func timerCounter(_ timer: Timer) {
        counter += 1
        let time = secondsToHoursMinutesSeconds(seconds: counter)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timeText = timeString
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    func secondsToHoursMinutesSeconds (seconds: Int) -> (Int, Int, Int) {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds.remainderReportingOverflow(dividingBy: 60).partialValue
        return (hours, minutes, seconds)
    }
}






extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

#Preview {
    TimerView()
}

//force unwrap -> !
// nil coalescing -> ??
//optional binding -> if let


