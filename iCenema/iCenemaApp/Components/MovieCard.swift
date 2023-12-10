//
//  MovieCard.swift
//  iCenema
//
//  Created by youcef hedibel on 10/12/2023.
//

import SwiftUI
import Kingfisher

struct MovieCard: View {
    
    let movieItem: Movie
    
    var body: some View {
        VStack(spacing: 0) {
            KFImage(movieItem.backdropUrl)
                .placeholder { _ in
                    HStack{
                        Spacer()
                        CircularProgress(color: .black).frame(width: 24, height: 24)
                        Spacer()
                    }
                }
                .resizable()
                .scaledToFill()
                .frame(height: 200)
          
            VStack(spacing: 10) {
                HStack {
                    Text(movieItem.original_title)
                        .font(.white, .semiBold, 20)
                    Spacer()
                }
                
                HStack {
                    Text(String(movieItem.vote_average))
                        .font(.yellow, .semiBold, 18)
                    Image(systemName: "star.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.yellow)
                    Spacer()
                    Text(String(movieItem.vote_count))
                        .font(.white, .semiBold, 18)
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                    
                }
            }
            .padding(.vertical,10)
            .padding(.horizontal,14)
            .background(Color.secondaryApp)
        }
        .cornerRadius(16)
        .padding(.horizontal,16)
        .padding(.vertical,5)
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movieItem: Movie(id: 981316, original_title: "The Elevator", overview: "Lily, an undercover reporter, poses as the new night manager at a seedy hotel to investigate a string of suspicious suicides. After playing the elevator game, she learns of a dark and sinister presence in the hotel. Can she find a conclusion to this mystery and put a stop to it before more murders occur?", original_language: "en", poster_path: "/xLJAxltTY2r5oSdPZS26pUUpzwS.jpg", backdrop_path: "/cKnaQwfOadbrisTs32oiFoCdDeF.jpg", vote_average: 5.7, vote_count: 145, release_date: "2023-10-05", genres: [Genre(id: 28, name: "Action"), Genre(id: 35, name: "Comedy")], runtime: 108))
    }
}
