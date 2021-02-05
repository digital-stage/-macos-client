//
//  LoginSettings.swift
//  macos-client
//
//  Created by Tobias Hegemann on 05.02.21.
//

import Foundation

class LoginSettings: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: String = ""
}
