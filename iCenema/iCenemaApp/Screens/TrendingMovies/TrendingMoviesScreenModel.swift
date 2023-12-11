//
//  TrendingMoviesScreenModel.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import Foundation

extension TrendingMoviesScreen {
    @MainActor
    class Model: ObservableObject {
        
        @Published private var _uiState: UiState<[Movie]> = .loading
        var uiState: UiState<[Movie]> { get { return _uiState } }
        @Published var listOfMovies = [Movie]()
        private var page: Int = 1
        @Published var isLoadingMore = false
        private var endOfPages = false

        func discoverMovies() {
            MoviesRepository.getDiscoverMovie(page: page) { movies in
                for movie in movies.results {
                    if !self.listOfMovies.contains(where: {$0.id == movie.id }) {
                        self.listOfMovies.append(movie)
                    }
                }
                
                if (self.page == movies.total_pages) {
                    self.endOfPages = true
                }
                self.isLoadingMore = false
                self._uiState = .success(self.listOfMovies)
            } failed: { error in
                self._uiState = .failed(error?.message)
            }
        }
        
         func loadMoreMovies(){
             if !endOfPages{
                 page += 1
                 self.isLoadingMore = true
                 discoverMovies()
             }
            
        }
    }
}
