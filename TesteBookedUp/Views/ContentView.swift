//
//  ContentView.swift
//  TesteBookedUp
//
//  Created by User on 16/04/26.
//

import SwiftUI
import Lottie

struct ContentView: View {
    @AppStorage("selectedTab") private var selectedTab = 0
        
    var body: some View {
        TabView (selection: $selectedTab){
            Tab("Sala", systemImage: "house", value: 0){
                HomeView()
            }
            
            Tab("Biblioteca", systemImage: "books.vertical", value: 0){
                LibraryView()
            }
            
            Tab("Diário", systemImage: "book", value: 0){
                SectionTemplatView()
            }
        }
    }
}

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

#Preview {
    ContentView()
}
