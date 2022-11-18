//
//  LogInViewModel.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 16/11/22.
//

import Foundation
import FirebaseAuth

class LogInViewMoel: ObservableObject {
    
    let auth = Auth.auth()
    @Published var signedIn = false 
    @Published var success = false
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func singIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password){ [weak self] result, error in
            
            guard result != nil , error == nil else {
                return
            }
            
            DispatchQueue.main.async{
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password){ [weak self] result, error in
            
            guard result != nil , error == nil else {
                return
            }
            
            DispatchQueue.main.async{
                self?.success = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false 
    }
}
