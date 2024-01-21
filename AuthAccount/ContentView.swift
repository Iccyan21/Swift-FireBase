//
//  ContentView.swift
//  AuthAccount
//
//  Created by 水原　樹 on 2024/01/19.
//

import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    @State var message = ""
    
    var body: some View {
        VStack {
            Text(message)
                .padding()
            
        // Firebaseのデータベース参照refを作成し、"message"というキーのデータを取得
        }.onAppear {
            // Firebaseからデータを取得
            let ref = Database.database().reference()
            // データベースの"message"という子ノードからデータを非同期的に取得するためのコード
            
            ref.child("message").getData { (error, snapshot) in
                // データ取得時にエラーが発生した場合の処理を行います。エラーがあれば、その内容をコンソールに出力します
                if let error = error {
                    print("Error getting data \(error)")
                }
                // データ取得が成功し、かつ取得したデータが存在する場合の処理
                else if let snapshot = snapshot, snapshot.exists() {
                    // ここでsnapshotはオプショナル型ではなくなります。
                    // String型として安全にキャスト
                    guard let message = snapshot.value as? String else {
                        return
                    }
                    self.message = message
                }
                else {
                    print("No data available")
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
