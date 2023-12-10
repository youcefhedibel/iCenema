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
                Color.primaryApp.ignoresSafeArea()
                VStack {
                    HStack{
                        Text("Trending movies")
                            .font(.white, .bold, 24)
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
                        ScrollView(showsIndicators: false){
                                ForEach(movies) { movie in
                                    NavigationLink {
                                        MovieDetailsScreen(movieID: movie.id)
                                    } label: {
                                        MovieCard(movieItem: movie)
                                    }
                                }
                        }

                    case .failed(let errorMsg):
                        Spacer()
                        Image(systemName: "network")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                        Text(errorMsg ?? "")
                            .font(.white, .regular, 20)
                        Spacer()
                    default: EmptyView()
                    }
                }
                .background(Color.primaryApp.ignoresSafeArea())
                .searchable(text: $movieToSearch)
            }
        }
        .onAppear(perform: model.discoverMovies)
    
    
    }
}



struct CTrendingMovies_Previews: PreviewProvider {
    static var previews: some View {
        TrendingMoviesScreen()
    }
}
