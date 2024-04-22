//
//  NewUserView.swift
//  FirebaseApp
//
//  Created by Daksh  on 22/04/24.
//

import SwiftUI

struct NewUserView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newUser = ""
    var body: some View {
        VStack {
            TextField("User", text: $newUser)
            
            Button {
                dataManager.addUser(userOccupation: newUser)
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}

#Preview {
    NewUserView()
}
