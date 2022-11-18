//
//  ContentView.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 16/11/22.
//

import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var logInVM: LogInViewMoel
    
    @State private var email: String = String()
    @State private var password: String = String()
    @State var showPassword: Bool = false
    var body: some View {
        
        VStack{
            Spacer()
            Image("icon_log_in")
                .resizable()
                .frame(width: 100, height: 100)
            
            TextField("Ingresa tu correo", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background()
                .cornerRadius(20)
                .padding([.horizontal, .top])
            if !showPassword {
                SecureField("Ingresa tu contraseña", text: $password)
                    .padding()
                    .background()
                    .cornerRadius(20)
                    .padding([.horizontal, .bottom])
                    .overlay(alignment: .trailing, content: {
                        Button(action: {
                            showPassword.toggle()
                        }, label: {
                            Image(systemName: "eye")
                                .padding()
                                .padding([.trailing, .bottom])
                        })
                    })
            } else{
            TextField("Ingresa tu contraseña", text: $password)
                .padding()
                .background()
                .cornerRadius(20)
                .padding([.horizontal, .bottom])
                .overlay(alignment: .trailing, content: {
                    Button(action: {
                        showPassword.toggle()
                    }, label: {
                        Image(systemName: "eye.slash")
                            .padding()
                            .padding([.trailing, .bottom])
                    })
                })
            }
            Button(action: {
                logInVM.singIn(email: email, password: password)
            }, label: {
                Text("Log in")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(.gray)
                    .cornerRadius(15)
            })
            NavigationLink(destination: {
                SignUpView()
            }, label: {
                Text("Crear cuenta")
                    .foregroundColor(Color.blue)
            })
            
            Spacer()
        }//VStack
        .background(
            Color.init(hex: "0D243F")
            
        )
        .ignoresSafeArea()
        
    }
}


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

