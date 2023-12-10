//
//  MoviesRepository.swift
//  iCenema
//
//  Created by mac on 10/12/2023.
//

import Foundation


class MoviesRepository: NetworkService {
    static let sharedMR = MoviesRepository()
    
    private enum Urls: String {
        case trendingMovies = "discover/movie"
        case movieDetails = ""
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
    
}
