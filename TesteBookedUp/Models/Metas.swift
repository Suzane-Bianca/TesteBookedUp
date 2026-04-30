//
//  Metas.swift
//  TesteBookedUp
//
//  Created by User on 28/04/26.
//

import SwiftUI
import SwiftData

//Meta 1: 60 min
//Meta 2: 100 min
//Meta 3: 150 min
//Meta 4: 210 min
//Meta 5: 300 min
//Meta 6: 360 min

//class  Metas {
//    var id = UUID()
//    var value: Int
//    var image: Image
//}


//
//#Preview {
//    Metas()
//}

//@Model
//class ProgressInGoal {
//    
//    var goal: Goal
//    var progress: Int = 0
//    
//    init(goal: Goal, progress: Int) {
//        self.goal = goal
//        self.progress = progress
//    }
//    
//}

enum Goal: Int, CaseIterable {
    
    case first = 60
    case sec = 100
    case third = 150
    case fourth = 210
    case fifth = 300
    case sixth = 360
    
    var calc: CGFloat {
        switch self {
        case .first:
            return 60
        case .sec:
            return 100
        case .third:
            return 150
        case .fourth:
            return 210
        case .fifth:
            return 300
        case .sixth:
            return 360
        }
    }
    
    var minutes: String {
        switch self {
        case .first:
            return "60"
        case .sec:
            return "100"
        case .third:
            return "150"
        case .fourth:
            return "210"
        case .fifth:
            return "300"
        case .sixth:
            return "360"
        }
    }
    var unlockProgress: Int {
        switch self {
        case .first:
            0
        case .sec:
            60
        case .third:
            160
        case .fourth:
            210
        case .fifth:
            310
        case .sixth:
            610
        }
    }
    
    var image: Image {
        switch self {
        case .first:
            return Image("Meta1")
        case .sec:
            return Image("Meta2")
        case .third:
            return Image("Meta3")
        case .fourth:
            return Image("Meta4")
        case .fifth:
            return Image("Meta5")
        case .sixth:
            return Image("Meta6")

        }
    }
}
