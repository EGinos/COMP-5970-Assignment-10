//
//  SignupView.swift
//  Assignment10
//
//  Created by user276229 on 7/27/25.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                Button("Sign Up") {
                    authVM.signUp(email: email, password: password)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Sign Up")
        }
    }
}
