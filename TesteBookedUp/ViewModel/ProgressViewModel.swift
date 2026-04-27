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
    
    func increaseProgress(with minutes: Int) -> Int {
        progress += minutes
        return progress
    }
}
