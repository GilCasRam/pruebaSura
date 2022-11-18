//
//  AccountView.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 18/11/22.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        
        let userName = UserDefaultsHelper.getData(type: String.self, forKey: .email)
        VStack{
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 70, height: 70)
                .padding()
            Text(userName ?? "User name")
            Spacer()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
