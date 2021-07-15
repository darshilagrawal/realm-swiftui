//
//  RealmAuth.swift
//  mongodb-swiftui
//
//  Created by Amey Sunu on 14/07/21.
//

import Foundation
import RealmSwift

let app = App(id: "swiftapp-ebdla")
typealias success = Bool

func RealmAuth(email:String, password:String, completion: @escaping (success) -> Void){
    app.login(credentials: Credentials.emailPassword(email: email, password: password)) { (result) in
        switch result {
        case .failure(let error):
            print("Login failed: \(error.localizedDescription)")
        case .success(let user):
            print("Successfully logged in as user \(user)")
            completion(true)
        }
    }
}

func RealmAuthAnonymous(completion: @escaping (success) -> Void){
    let anonymousCredentials = Credentials.anonymous
    app.login(credentials: anonymousCredentials) { (result) in
        switch result {
        case .failure(let error):
            print("Login failed: \(error.localizedDescription)")
        case .success(let user):
            print("Successfully logged in as user \(user)")
            completion(true)
        }
    }

}

func RealmRegister(email:String, password:String, completion: @escaping (success) -> Void){
    let client = app.emailPasswordAuth
    let email = email
    let password = password
    client.registerUser(email: email, password: password) { (error) in
        guard error == nil else {
            print("Failed to register: \(error!.localizedDescription)")
            return
        }
        completion(true)
        print("Successfully registered user.")
    }

}
