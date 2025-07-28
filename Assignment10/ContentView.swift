//
//  ContentView.swift
//  Assignment10
//
//  Created by user276229 on 7/27/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        Group {
            if authVM.user != nil {
                HomeView()
            }
            else {
                LoginView()
            }
        }
        .alert(item: $authVM.authError) { err in
            Alert(title: Text("Error"), message: Text(err.message), dismissButton: .default(Text("OK")))
        }
    }
}
