//
//  Metas.swift
//  TesteBookedUp
//
//  Created by User on 28/04/26.
//

import SwiftUI
import SwiftData

enum Goal: Int, CaseIterable {
    
    case first = 60
    case sec = 100
    case third = 150
    case fourth = 210
    case fifth = 300
    case sixth = 360
    
//    static var allCases: [Goal] = [.first, .sec, .third, .fourth, .fifth, .sixth]
    
    
    var calc: CGFloat {
        switch self {
        case .first:
            return 0
        case .sec:
            return 60
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
    
    var zerar: Int {
        switch self {
        case .first:
            0
        case .sec:
            0
        case .third:
            0
        case .fourth:
            0
        case .fifth:
            0
        case .sixth:
            0
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
            60
        case .sec:
            160
        case .third:
            310
        case .fourth:
            520
        case .fifth:
            820
        case .sixth:
            1180
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
