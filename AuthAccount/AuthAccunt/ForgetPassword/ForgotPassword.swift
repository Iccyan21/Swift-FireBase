//
//  ForgotPassword.swift
//  AuthAccount
//
//  Created by 水原　樹 on 2024/01/21.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email: String = ""
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Reset Password") {
                viewModel.resetPassword(email: email)
            }
        }
    }
}
