//
//  Password.swift
//  iPassword
//
//  Created by MikhaiL on 12.07.2023.
//

import SwiftUI

struct Password: Identifiable, Codable {
    var id = UUID()
    let password: String
    let containsSymbols: Bool
    let containsUppercase: Bool
    
    var strengthColor: Color {
        var strength = 0
        var color: Color
        
        if containsSymbols {
            strength += 1
        }
        
        if containsUppercase {
            strength += 1
        }
        
        if password.count > 12 {
            strength += 1
        } else if password.count < 8 {
            strength -= 1
        }
        
        switch strength {
            case 1: color = .green
            case 2: color = .yellow
            case 3: color = .red
            default: color = .gray
        }
        return color
    }
}
