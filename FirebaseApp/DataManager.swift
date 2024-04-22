//
//  DataManager.swift
//  FirebaseApp
//
//  Created by Daksh  on 22/04/24.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var user: [User] = []
    
    init() {
        
    }
    
    func fetchUsers() {
        user.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("User")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let occupation = data["occupation"] as? String ?? ""
                    
                    let users = User(id: id, occupation: occupation)
                    self.user.append(users)
                }
            }
            
        }
    }
    func addUser(userOccupation: String) {
        let db = Firestore.firestore()
        let ref = db.collection("User").document(userOccupation)
        ref.setData(["occupation": userOccupation, "id": 10]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }

}



