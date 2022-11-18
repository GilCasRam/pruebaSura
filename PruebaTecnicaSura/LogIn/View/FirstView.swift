//
//  FirstView.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 16/11/22.
//

import SwiftUI

struct FirstView: View {
    
    @EnvironmentObject var viewModel: LogInViewMoel
    @State var goToMain: Bool = false
    
    var body: some View {
        NavigationView{
        if viewModel.signedIn {
            MainView()
        } else {
            LogInView()
        }
    }.onAppear{
        viewModel.signedIn = viewModel.isSignedIn
    }
    
    
}
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
