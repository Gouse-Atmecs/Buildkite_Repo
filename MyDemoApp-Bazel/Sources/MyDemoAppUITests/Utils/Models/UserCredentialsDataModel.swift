//
//  UserCredentialsDataModel.swift
//  MyDemoAppUITests
//
//  Created by Mohammad Gouse Jani on 10/12/24.
//

import Foundation

// Model representing user credentials
struct CredentialsDataModel: Codable {
    let userName: String?
    let password: String?
}

// Type alias for the list of users (just an array of `CredentsialDataModel` objects)
typealias UserCredentialsDataModel = [CredentialsDataModel]
