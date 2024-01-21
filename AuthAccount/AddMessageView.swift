//
//  AddMessageView.swift
//  AuthAccount
//
//  Created by 水原　樹 on 2024/01/21.
//

import SwiftUI
import FirebaseDatabase

struct AddMessageView: View {
    @State var message = ""
    
    var body: some View {
        VStack {
            TextField("", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                let ref = Database.database().reference()
                ref.child("message").setValue(message)
            }) {
                Text("保存")
            }
        }.onAppear {
            let ref = Database.database().reference()
            ref.child("message").getData { (error, snapshot) in
                if let error = error {
                    print("Error getting data \(error)")
                }
                else if let snapshot = snapshot, snapshot.exists() {
                    // ここでsnapshotはオプショナル型ではなくなります。
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

#Preview {
    AddMessageView()
}
