//
//  Movie.swift
//  iCenema
//
//  Created by mac on 10/12/2023.
//

import Foundation


struct Movies: Decodable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
}

struct Movie: Decodable, Identifiable {
    let id: Int
    let original_title: String
    let overview: String
    let original_language: String
    let poster_path: String
    let backdrop_path: String
    let vote_average: Float
    let vote_count: Int
    
    var backdropUrl: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: backdrop_path)
    }
    
    var posterPathUrl: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")
        return baseURL?.appending(path: poster_path)
    }

}
