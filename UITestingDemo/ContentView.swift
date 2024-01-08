//
//  ContentView.swift
//  UITestingDemo
//
//  Created by Josset Leonel Garcia Flores on 06-01-24.
//

import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    @State private var isLoggedIn = false
    @State private var username = ""

    var body: some View {
        VStack {
            Text(!isLoggedIn ? "Welcome!" : "Welcome \(username)!")
                .font(.title)

            Spacer().frame(height: 20)

            Button(action: {
                if !isLoggedIn {
                    showLogin = true
                } else {
                    logout()
                }
            }, label: {
                Text(!isLoggedIn ? "Login" : "Logout")
            })
            .accessibilityIdentifier("loginButton")

        }
        .sheet(isPresented: $showLogin) {
            LoginView(isLoggedIn: $isLoggedIn, username: $username)
        }
    }

    func logout() {
        isLoggedIn = false
        username = ""
    }
}

#Preview {
    ContentView()
}
