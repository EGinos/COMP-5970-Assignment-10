//
//  HomeView.swift
//  Assignment10
//
//  Created by user276229 on 7/27/25.
//

import SwiftUI

struct Note: Identifiable {
    let id = UUID()
    let text: String
}

struct HomeView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    private let notes = [
        Note(text: "Buy groceries"),
        Note(text: "Call mom"),
        Note(text: "Finish making this app")
    ]
    
    var body: some View {
        NavigationStack {
            List(notes) { note in
                Text(note.text)
            }
            .navigationTitle("My Notes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        authVM.signOut()
                    }
                }
            }
        }
    }
}
