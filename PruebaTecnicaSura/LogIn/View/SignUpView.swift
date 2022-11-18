//
//  SignUpView.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 16/11/22.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var logInVM: LogInViewMoel
    
    @State private var email: String = String()
    @State private var password: String = String()
    @State var showAlert: Bool = false
    var body: some View {
        
        VStack{
            Text("Crea tu cuenta")
                .foregroundColor(Color.white)
                .font(.system(.largeTitle, design: .monospaced))
                .font(.system(size: 30))
                .padding(.bottom)
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
            
            TextField("Ingresa tu contraseña", text: $password)
                .padding()
                .background()
                .cornerRadius(20)
                .padding([.horizontal, .bottom])
            
            Button(action: {
                logInVM.signUp(email: email, password: password)
            }, label: {
                Text("Crear cuenta")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(.gray)
                    .cornerRadius(15)
            })
                .padding(.bottom)
            Spacer()
        }//VStack
        .background(
            Color.init(hex: "0D243F")
                .ignoresSafeArea()
        )
        .alert(Text("Registro exitoso"), isPresented: $showAlert, actions: {
            Button("Aceptar") {presentationMode.wrappedValue.dismiss()}
            
        })
        .onReceive(logInVM.$success, perform: { success in
            if success {
                showAlert = true
            }
        })
   
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
