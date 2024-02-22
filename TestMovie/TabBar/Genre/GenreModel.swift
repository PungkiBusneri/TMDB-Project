//
//  GenreModel.swift
//  TestMovie
//
//  Created by Pungki Busneri on 31/01/24.
//

import Foundation

struct TopRated {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let genres: [Genre]
    
    init(data: [String: Any]) {
        adult = data["adult"] as? Bool ?? false
        backdropPath = data["backdropPath"] as? String ?? ""
        id = data["id"] as? Int ?? 0
        originalLanguage = data["original_language"] as? String ?? ""
        originalTitle = data["original_title"] as? String ?? ""
        overview = data["overview"] as? String ?? ""
        popularity = data["popularity"] as? Double ?? 0
        posterPath = data["poster_path"] as? String ?? ""
        releaseDate = data["release_date"] as? String ?? ""
        title = data["title"] as? String ?? ""
        video = data["video"] as? Bool ?? false
        voteAverage = data["vote_average"] as? Double ?? 0
        voteCount = data["vote_count"] as? Int ?? 0
        
        let genres = data["genres"] as? [[String:Any]] ?? nil
        var dataGenres = [Genre]()
        
        if genres != nil {
            for genre in genres! {
                let id = genre["id"] as? Int ?? 0
                let name = genre["name"] as? String ?? ""
                let genreData = Genre(id: id, name: name)
                dataGenres.append(genreData)
            }
        }
        self.genres = dataGenres
    }
}
