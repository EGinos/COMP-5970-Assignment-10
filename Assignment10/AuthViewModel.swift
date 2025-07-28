//
//  AuthViewModel.swift
//  Assignment10
//
//  Created by user276229 on 7/27/25.
//

import Foundation
import FirebaseAuth

struct AuthError: Identifiable {
    let id = UUID()
    let message: String
}

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var authError: AuthError?
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        handle = Auth.auth().addStateDidChangeListener{ _, firebaseUser in self.user = firebaseUser }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    private func handleError(error: Error) {
        self.authError = AuthError(message: error.localizedDescription)
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.handleError(error: error)
            }
            else {
                self.user = result?.user
            }
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.handleError(error: error)
            }
            else {
                self.user = result?.user
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        }
        catch {
            self.handleError(error: error)
        }
    }
}
