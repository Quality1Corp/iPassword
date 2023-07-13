//
//  ViewModifiers.swift
//  iPassword
//
//  Created by MikhaiL on 13.07.2023.
//

import SwiftUI

extension View {
    func centerH() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    func addNavigationView(title: String) -> some View {
        NavigationView {
            self
                .navigationTitle(title)
        }
    }
}
