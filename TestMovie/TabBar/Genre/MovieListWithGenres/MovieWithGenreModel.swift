//
//  MovieWithGenreModel.swift
//  TestMovie
//
//  Created by Pungki Busneri on 20/02/24.
//

import Foundation

struct MovieWithGenreModel {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
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
    
    init (data: [String: Any]) {
        adult = data["adult"] as? Bool ?? false
        backdropPath = data["backdrop_path"] as? String ?? ""
        genreIDS = data["genre_ids"] as? [Int] ?? []
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
    }
}
