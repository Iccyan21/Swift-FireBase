//
//  HelloPage.swift
//  AuthAccount
//
//  Created by 水原　樹 on 2024/01/21.
//

import SwiftUI

// ログイン後の画面
struct HelloPage: View {
    var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text("Hello, you're logged in!")
                .font(.title)
                .padding()
            Button("Log Out") {
                // ログアウトしてログイン画面へ遷移する
                viewModel.signOut()
            }
        }
    }
}
