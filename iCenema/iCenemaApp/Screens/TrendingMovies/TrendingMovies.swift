//
//  ContentView.swift
//  iCenema
//
//  Created by mac on 10/12/2023.
//

import SwiftUI

struct TrendingMoviesScreen: View {
    @StateObject private var model = Model()
    var body: some View {
        ZStack {
            Color.primaryApp.ignoresSafeArea()
            VStack {
                switch model.uiState {
                case .loading:
                    Spacer()
                    CircularProgress(color: .white,lineWidth: 4)
                        .frame(width:50, height: 50)
                    Spacer()
                case .success(let movies):
                    ScrollView(showsIndicators: false){
                            ForEach(movies) { movie in
                                MovieCard(movieItem: movie)
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
        }.onAppear(perform: model.discoverMovies)
    
    }
}



struct CTrendingMovies_Previews: PreviewProvider {
    static var previews: some View {
        TrendingMoviesScreen()
    }
}
