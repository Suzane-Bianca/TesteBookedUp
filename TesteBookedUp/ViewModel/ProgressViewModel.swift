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
    var progress: Double = 1
    
    func increaseProgress(with minutes: Double) {
        progress += minutes
    }
}
