//
//  MoviesRepository.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import Foundation


class MoviesRepository: NetworkService {
    static let sharedMR = MoviesRepository()
    
    private enum Urls: String {
        case trendingMovies = "discover/movie"
        case movieDetails = "movie/{movie_id}"
        case searchMovie = "search/movie"
    }
    
    static func getDiscoverMovie(page: Int,success: @escaping (Movies) -> Void, failed: @escaping (ErrorResponse?) -> Void) {
        let query: [String: Any] = [
            "include_adult": false,
            "include_video": false,
            "language": "en-US",
            "page": page,
            "sort_by": "popularity.desc"
        ]
        sharedNS.get(url: Urls.trendingMovies.rawValue, query: query, success: success, failed: failed)
    }
    
    static func getMovieDetail(id: Int, success: @escaping (Movie) -> Void, failed: @escaping (ErrorResponse?) -> Void) {
        sharedNS.get(url: Urls.movieDetails.rawValue.replacingOccurrences(of: "{movie_id}", with: id.description), success: success, failed: failed)
    }
    
    static func searchMovie(text: String,success: @escaping (Movies) -> Void, failed: @escaping (ErrorResponse?) -> Void) {
        let query: [String: Any] = [
            "query": text,
            "language": "en-US",
            "include_adult": false,
            "page": 1
        ]
        sharedNS.get(url: Urls.searchMovie.rawValue, query: query, success: success, failed: failed)
    }
    
}
