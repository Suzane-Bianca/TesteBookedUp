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
    var progressWork: Int = 0
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
    
    func VisuProgress(with minutes: Int, totalProgress: Int)->Int {
        self.totalProgress = progress
        return totalProgress
        
    }
    
    func updateProgres(with minutes: Int, totalProgress: Int) -> Int{
        self.progressWork = progress
        
        if(progressWork <= 60){
            return 60
        } else if(progressWork > 60 || progressWork <= 100 ){
            //            clearProgress(with: progressWork, totalProgress: totalProgress) Nao sei se faço isso
            return 100
        } else if(progressWork > 100 || progressWork <= 150){
            return 150
        } else if(progressWork > 150 || progressWork <= 210){
            return 210
        } else if(progressWork > 210 || progressWork <= 300){
            return 300
        } else if (progressWork > 300 || progress <= 360){
            return 360
        }
        
        return 360
    }
    
    func clearProgress(with progressWork: Int, totalProgress: Int) -> Int {
        self.totalProgress = progressWork
        self.progressWork = 0
        return progressWork
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
