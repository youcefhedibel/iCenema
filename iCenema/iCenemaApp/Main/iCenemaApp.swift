//
//  iCenemaApp.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import SwiftUI

@main
struct iCenemaApp: App {
    var body: some Scene {
        WindowGroup {
//            MovieCard(movieItem:  Movie(id: 981316, original_title: "The Elevator", overview: "Lily, an undercover reporter, poses as the new night manager at a seedy hotel to investigate a string of suspicious suicides. After playing the elevator game, she learns of a dark and sinister presence in the hotel. Can she find a conclusion to this mystery and put a stop to it before more murders occur?", original_language: "en", poster_path: "/xLJAxltTY2r5oSdPZS26pUUpzwS.jpg", backdrop_path: "/cKnaQwfOadbrisTs32oiFoCdDeF.jpg", vote_average: 5.7))
            TrendingMoviesScreen()
        }
    }
}
