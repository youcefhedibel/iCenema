//
//  MovieDetails.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import SwiftUI
import Kingfisher

struct MovieDetailsScreen: View {
    @StateObject private var model = Model()
    var movieID: Int
    var body: some View {
        ZStack{
            Color.primaryApp.ignoresSafeArea()
            VStack(alignment: .leading){
                switch model.uiState {
                case .loading:
                    Spacer()
                    CircularProgress(color: .white, lineWidth: 4)
                        .frame(width: 50, height: 50)
                    Spacer()
                case .success(let movie):
                    KFImage(movie.backdropUrl)
                        .placeholder { _ in
                            HStack{
                                Spacer()
                                CircularProgress(color: .white).frame(width: 24, height: 24)
                                Spacer()
                            }
                        }
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding(.horizontal)
                    movieInfoComponent(movie: movie)
                    aboutMovieCOmponent(text: movie.overview)
                    Spacer()
                default: EmptyView()
                }

            }.onAppear{
                model.getMovieDetails(id: movieID)
            }
        }
       
    }
    
    @ViewBuilder
    private func movieInfoComponent(movie: Movie) -> some View {
        VStack{
            HStack(spacing:5){
                Text(movie.original_title)
                    .font(.primaryText, .bold, 26)
                Spacer()
                Image(systemName: "star.fill")
                    .font(.system(size: 14))
                    .foregroundColor(.yellow)
                Text(String(round(10 * movie.vote_average) / 10))
                    .font(.yellow, .semiBold, 18)
                Text("(\(movie.vote_count))")
                    .font(.gray, .regular, 16)
            }.padding()
            
            HStack{
                roundedTextComponent(text: movie.formmated_release_date)
                ForEach((movie.genres ?? []).enumerated().prefix(2).map(\.element), id: \.id) { genre in
                    roundedTextComponent(text: genre.name)
                }
                Spacer()
                Image(systemName: "clock.fill")
                    .font(.system(size: 14))
                    .foregroundColor(.primaryText)
                Text(movie.formatted_runtime)
                    .font(.primaryText, .regular, 16)

            }.padding(.horizontal)
        }

    }
    
    @ViewBuilder
    private func aboutMovieCOmponent(text: String) -> some View{
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                       Text("About film")
                           .font(.primaryText, .regular, 20)
                       Text(text)
                           .font(.primaryText, .medium, 16)
                           .multilineTextAlignment(.leading)
                           .padding()
                           .background(RoundedRectangle(cornerRadius:15).foregroundColor(.secondaryApp))
                   }.padding()
        }
       
    }
    
    @ViewBuilder
    private func roundedTextComponent(text: String) -> some View {
        Text(text)
            .font(.primaryText, .semiBold, 14)
            .padding(5)
            .background(RoundedRectangle(cornerRadius:15).foregroundColor(.secondaryApp))
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsScreen(movieID: 897087)
    }
}
