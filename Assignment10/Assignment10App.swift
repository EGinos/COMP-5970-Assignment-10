//
//  Assignment10App.swift
//  Assignment10
//
//  Created by user276229 on 7/27/25.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct Assignment10App: App {
    @StateObject private var authVM = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authVM)
        }
    }
}
