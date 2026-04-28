//
//  Metas.swift
//  TesteBookedUp
//
//  Created by User on 28/04/26.
//

import SwiftUI

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

enum Goal: Int, CaseIterable {
    case first = 60
    case sec = 100
    case third = 150
    case fourth = 210
    case fifth = 300
    case sixth = 360
    
    
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
