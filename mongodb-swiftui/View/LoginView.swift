//
//  LoginView.swift
//  mongodb-swiftui
//
//  Created by Amey Sunu on 14/07/21.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var isNavigated: Bool = false
    @State var load: Bool = false
    @State var anyload: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()
                TextField("Email ID",text: $email)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(lineWidth: 1.0))
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(lineWidth: 1.0))
                
                NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: $isNavigated) {
                    Button(action: {
                        self.load.toggle()
                        RealmAuth(email: email, password: password){
                            (success) -> Void in
                            if success {
                                self.isNavigated = true
                                self.load.toggle()
                            }else {
                                self.load.toggle()
                            }
                        }
                    }) {
                        if(load == true){
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                                    .padding(8)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 2.0)
                                                .shadow(color: .gray, radius: 10.0))
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
                            .disabled(true)
                        } else {
                        Text("Login")
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 2.0)
                                        .shadow(color: .blue, radius: 10.0))
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                    }
                    }
                    .padding(.top, 10)
                }
                
                HStack {
                    Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
                    Text("or")
                        .font(.title3)
                        .foregroundColor(.gray)
                    Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
                }
                
                NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true), isActive: $isNavigated) {
                    Button(action: {
                        RealmAuthAnonymous(){
                            (success) -> Void in
                            if success {
                                self.isNavigated = true
                                self.anyload.toggle()
                            } else {
                                self.anyload.toggle()
                            }
                        }
                    }) {
                        if(anyload == true){
                            HStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                                    .padding(8)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 2.0)
                                                .shadow(color: .gray, radius: 10.0))
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
                            .disabled(true)
                        } else {
                        Text("Login Anonymously")
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 2.0)
                                        .shadow(color: .blue, radius: 10.0))
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                    }
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: RegisterView()) {
                        Text("I'm new here. Create a new account?")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                }
                
            }
            .navigationTitle("Login")
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
