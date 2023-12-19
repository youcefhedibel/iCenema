//
//  ContentView.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import SwiftUI

struct TrendingMoviesScreen: View {
    @StateObject private var model = Model()
    @State private var movieToSearch: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient.backGroundeLinearGradient.ignoresSafeArea()
                VStack {
                    HStack{
                        Text("Trending movies")
                            .font(.primaryText, .bold, 24)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        Spacer()
                    }
                    
                    switch model.uiState {
                    case .loading:
                        Spacer()
                        CircularProgress(color: .white,lineWidth: 4)
                            .frame(width:50, height: 50)
                        Spacer()
                    case .success(let movies):
                        if movies.isEmpty {
                            Spacer()
                                Image(systemName: "magnifyingglass")
                                .font(.system(size: 34))
                                .foregroundColor(.primaryText)
                                .padding()
                                Text("Sorry! No result found (:")
                                .font(.primaryText, .regular, 22)
                            Spacer()
                        } else {
                            ScrollView(showsIndicators: false){
                                LazyVStack{
                                    ForEach(movies) { movie in
                                        NavigationLink {
                                            MovieDetailsScreen(movieID: movie.id)
                                        } label: {
                                            MovieCard(movieItem: movie)
                                                .onAppear{
                                                    if (movies.last?.id == movie.id && movieToSearch.isEmpty) {
                                                       model.loadMoreMovies()
                                                    }
                                                }
                                        }
                                    }
                                }
                                Spacer().frame(height:  16)
                                if model.isLoadingMore {
                                    VStack{
                                        Spacer()
                                        CircularProgress().frame(width: 40, height: 40).padding(.bottom, 10)
                                        Spacer()
                                    }
                                }
                            }
                        }

                    case .failed(let errorMsg):
                        Spacer()
                        Image(systemName: "network")
                            .font(.system(size: 40))
                            .foregroundColor(.primaryText)
                        Text(errorMsg ?? "")
                            .font(.primaryText, .regular, 20)
                        Button {
                            model.discoverMovies()
                        } label: {
                            Text("try again")
                                .font(.white, .semiBold, 16)
                        }.padding(5)
                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.secondaryApp))
                        
                        Spacer()
                    default: EmptyView()
                    }
                }
                .searchable(text: $movieToSearch, prompt: "Search movie").foregroundColor(.white)
            }
        }
        .onAppear(perform: model.discoverMovies)
        .onChange(of: movieToSearch) { newValue in
            if newValue.count > 2 {
                model.searchMovie(text: newValue)
            } else if newValue == "" {
                model.discoverMovies()
            }
        }
    }
}

struct CTrendingMovies_Previews: PreviewProvider {
    static var previews: some View {
        TrendingMoviesScreen()
    }
}
