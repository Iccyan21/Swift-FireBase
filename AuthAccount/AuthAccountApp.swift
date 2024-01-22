//
//  AuthAccountApp.swift
//  AuthAccount
//
//  Created by 水原　樹 on 2024/01/19.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
    // アプリが起動した時に呼び出される
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // FirebaseApp.configure() を呼び出してFirebaseを初期化
        FirebaseApp.configure()
        
        return true
    }
}

// アプリケーションの起動時にこの構造体が使用される

@main
struct SwiftUiFirebaseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    // 監視し、できる
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
