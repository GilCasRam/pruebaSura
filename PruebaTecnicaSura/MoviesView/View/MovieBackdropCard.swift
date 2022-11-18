//
//  MovieBackdropCard.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 16/11/22.
//


import SwiftUI

struct MovieBackdropCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .frame(width: 170, height: 200)
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(movie.title)
            HStack{
                Text(movie.releaseDate ?? "")
                Spacer()
                Image(systemName: "star.fill")
                Text("\(String(format: "%.1f", movie.voteAverage))")
            }
            Text(movie.overview )
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MovieBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCard(movie: Movie.stubbedMovie)
    }
}
