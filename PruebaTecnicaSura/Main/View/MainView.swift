//
//  MainView.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 16/11/22.
//

import SwiftUI


struct MainView: View {
    @EnvironmentObject var viewModel: LogInViewMoel
    @State var showMenu: Bool = false
    @State var tabSelection: Int = 0
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Movie app")
                Spacer()
                Menu{
                    Button("Cerrar sesion", action: logOut)
                    Button("Menu", action: showProfile)
                } label: {
                    Image(systemName: "line.3.horizontal")
                }
            }
            .padding()
            
            Picker("", selection: $tabSelection){
                Text("Popular").tag(0)
                   
                Text("Top rate").tag(1)
                   
                Text("Favoritos").tag(2)
                   
            }.padding()
            .pickerStyle(.segmented)
            Spacer()
            
            if tabSelection == 0 {
                if popularState.movies != nil {
                    MovieBackdropCarouselView(title: "Popular", movies: popularState.movies!)
                    
                } else {
                    LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                        self.popularState.loadMovies(with: .popular)
                    }
                }
            }
            if tabSelection == 1{
                if topRatedState.movies != nil {
                    MovieBackdropCarouselView(title: "Top Rated", movies: topRatedState.movies!)
                    
                } else {
                    LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                        self.topRatedState.loadMovies(with: .topRated)
                    }
                }
            }
            if tabSelection == 2 {
                if upcomingState.movies != nil {
                    MovieBackdropCarouselView(title: "Upcoming", movies: upcomingState.movies!)
                } else {
                    LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                        self.upcomingState.loadMovies(with: .upcoming)
                    }
                }

            }
            
            NavigationLink(isActive: $showMenu,
            destination: {
                Text("Menu")
            }, label: {
                
            })
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }
    }
    func logOut() {
        viewModel.signOut()
    }
    func showProfile() {
        showMenu = true
    }
    
   
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
