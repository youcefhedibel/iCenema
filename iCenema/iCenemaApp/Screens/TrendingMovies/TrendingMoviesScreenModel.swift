//
//  TrendingMoviesScreenModel.swift
//  iCenema
//
//  Created by mac on 10/12/2023.
//

import Foundation

extension TrendingMoviesScreen {
    @MainActor
    class Model: ObservableObject {
        
        @Published private var _uiState: UiState<[Movie]> = .idle
        var uiState: UiState<[Movie]> { get { return _uiState } }
        
        func discoverMovies() {
            _uiState = .loading
            MoviesRepository.getDiscoverMovie(page: 1) { movies in
                self._uiState = .success(movies.results)
            } failed: { error in
                self._uiState = .failed(error?.message)
            }
        }
    }
}
