//
//  MovieDetailScreenModel.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import Foundation

extension MovieDetailsScreen {
    
    class Model: ObservableObject {
        @Published private var _uiState: UiState<Movie> = .idle
        var uiState: UiState<Movie> { get { return _uiState } }
        
        func getMovieDetails(id: Int) {
            self._uiState = .loading
            MoviesRepository.getMovieDetail(id: id) { movie in
                self._uiState = .success(movie)
            } failed: { error in
                self._uiState = .failed(error?.message)
            }
        }
    }
}
