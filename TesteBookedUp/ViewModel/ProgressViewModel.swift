//
//  ProgressViewModel.swift
//  TesteBookedUp
//
//  Created by User on 27/04/26.
//

import Foundation
import SwiftUI

@Observable
class ProgressViewModel {
    var progress: Int = 0
    var totalProgress: Int = 0
    var Goal: Goal = .first
    
    func increaseProgress(with minutes: Int) -> Int {
            progress += minutes
            return progress
    }
    
    func userCurrentGoal() -> (Goal) {
            switch progress {
            case 0...50:
                return .first
            case 50...100:
                return .sec
            case 101...150:
                return .third
            case 151...200:
                return .fourth
            case 201...250:
                return .fifth
            default:
                return .first
        }
    }
    
    func updateProgress(with minutes: Int, totalProgress: Int)->Int {
        self.totalProgress = progress
        return totalProgress
        
    }
    
//    func currentGoal() -> Goal {
//        
//    }
    
   
    
//    @AppStorage("progresso") var progresso: Int = 0
//    
//    //var progresso : Int = 0
//    
//    func increaseProgress(with minutes: Int) {
//        progresso += minutes
//    }
//    
//    func getProgress() -> Int {
//        return progresso
//    }

}
