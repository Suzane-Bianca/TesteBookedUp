//
//  Book.swift
//  TesteBookedUp
//
//  Created by User on 24/04/26.
//

import SwiftUI
import SwiftData

@Model
class Book: Identifiable {
    var id = UUID()
    var nome: String
    
    init (nome: String){
        self.nome = nome
    }
}
