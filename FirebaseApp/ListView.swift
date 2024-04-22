//
//  ListView.swift
//  FirebaseApp
//
//  Created by Daksh  on 22/04/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    var body: some View {
        NavigationView {
            List(dataManager.user, id: \.id) { user in
                Text(user.occupation)
                
                
            }
            .navigationTitle("User")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup) {
                NewUserView()
            }
        }
    }
}

#Preview {
    ListView()
        .environmentObject(DataManager())
}
