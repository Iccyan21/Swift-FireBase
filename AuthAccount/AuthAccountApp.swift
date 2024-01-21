//
//  AuthAccountApp.swift
//  AuthAccount
//
//  Created by 水原　樹 on 2024/01/19.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}


@main
struct SwiftUiFirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            // ログイン状態によって画面遷移するページを変更する
            if viewModel.isAuthenticated {
                HelloPage(viewModel: viewModel)
            } else {
                SignInView(viewModel: viewModel)
            }
        }
    }
}
