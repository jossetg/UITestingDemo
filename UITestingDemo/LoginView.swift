//
//  LoginView.swift
//  UITestingDemo
//
//  Created by Josset Leonel Garcia Flores on 06-01-24.
//

import Foundation
import SwiftUI

struct LoginView: View {

    @Environment(\.presentationMode) var presentationMode

    @Binding var isLoggedIn: Bool
    @State private var showAlert = false
    @Binding var username: String
    @State private var password = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $username)
                    SecureField("Password", text: $password)
                }

                Button {
                    if login() {
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showAlert = true
                    }
                } label: {
                    Text("Login")
                }
                .accessibilityIdentifier("loginNow")
            }
            .navigationTitle(Text("Login"))
            .navigationBarItems(trailing: Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .accessibilityLabel("Dismiss")
            })
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Login Failed"),
                  message: Text("Username or password is wrong."),
                  dismissButton: Alert.Button.default(Text("OK"), action: {
                    showAlert = false
                  }))
        }
    }

    func login() -> Bool {
        guard username == "test" && password == "pass" else {
            return false
        }

        password = ""
        isLoggedIn = true
        return true
    }
}
