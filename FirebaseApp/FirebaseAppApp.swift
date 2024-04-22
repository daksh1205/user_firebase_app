//
//  FirebaseAppApp.swift
//  FirebaseApp
//
//  Created by Daksh  on 22/04/24.
//

import SwiftUI
import Firebase

@main
struct FirebaseAppApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}
