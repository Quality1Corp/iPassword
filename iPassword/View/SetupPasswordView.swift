//
//  SetupPasswordView.swift
//  iPassword
//
//  Created by MikhaiL on 12.07.2023.
//

import SwiftUI

struct SetupPasswordView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Form {
            Section("Options") {
                Toggle("Symbols", isOn: $viewModel.containsSymbols)
                Toggle("Uppercase", isOn: $viewModel.containsUppercase)
                Stepper("Character count: \(viewModel.length)", value: $viewModel.length, in: 6...18)
                Button("Generate password", action: viewModel.createPassword)
                    .centerH()
            }
            Section("Passwords") {
                List(viewModel.passwords) { password in
                    HStack {
                        Text("\(password.password)")
                            .padding()
                            .textSelection(.enabled)
                        Spacer()
                        Image(systemName: "lock.fill")
                            .foregroundColor(password.strengthColor)
                    }
                }
            }
        }
        .addNavigationView(title: "iPassword")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetupPasswordView()
    }
}
