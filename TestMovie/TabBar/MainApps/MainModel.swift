//
//  MainModel.swift
//  TestMovie
//
//  Created by Pungki Busneri on 28/02/24.
//

import Foundation

struct TopActorAndActris {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartement: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String
    let knownFor: [TherMovies]
    
    init (data: [String:Any]) {
        adult = data["adult"] as? Bool ?? false
        gender = data["gender"] as? Int ?? 0
        id = data["id"] as? Int ?? 0
        knownForDepartement = data["known_for_departement"] as? String ?? ""
        name = data["name"] as? String ?? ""
        originalName = data["original_name"] as? String ?? ""
        popularity = data["popularity"] as? Double ?? 0
        profilePath = data["profile_path"] as? String ?? ""
        
        if let knownForData = data["known_for"] as? [[String: Any]] {
            knownFor = knownForData.map { TherMovies(data: $0) }
        } else {
            knownFor = []
        }
    }
}
struct TherMovies {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let name: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let mediaType: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Double
    
    init (data: [String: Any]) {
        adult = data["adult"] as? Bool ?? false
        backdropPath = data["backdrop_path"] as? String ?? ""
        id = data["id"] as? Int ?? 0
        title = data["title"] as? String ?? ""
        name = data["name"] as? String ?? ""
        originalTitle = data["original_title"] as? String ?? ""
        originalLanguage = data["original_language"] as? String ?? ""
        overview = data["overview"] as? String ?? ""
        posterPath = data["poster_path"] as? String ?? ""
        mediaType = data ["media_type"] as? String ?? ""
        genreIDS = data["genre_ids"] as? [Int] ?? [0]
        popularity = data["popularity"] as? Double ?? 0
        releaseDate = data["release_date"] as? String ?? ""
        video = data["video"] as? Bool ?? false
        voteAverage = data["vote_average"] as? Double ?? 0
        voteCount = data["vote_count"] as? Double ?? 0
        
    }
}

struct OnTrendingMovies {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let mediaPath: String
    let genreIDS: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    init (data: [String: Any]) {
        adult = data["adult"] as? Bool ?? false
        backdropPath = data["backdrop_path"] as? String ?? ""
        id = data["id"] as? Int ?? 0
        title = data["title"] as? String ?? ""
        originalLanguage = data["original_language"] as? String ?? ""
        originalTitle = data["original_title"] as? String ?? ""
        overview = data["overview "] as? String ?? ""
        posterPath = data["poster_path"] as? String ?? ""
        mediaPath = data["media_path"] as? String ?? ""
        genreIDS = data["genre_ids"] as? [Int] ?? [0]
        popularity = data["popularity"] as? Double ?? 0
        releaseDate = data["release_date"] as? String ?? ""
        video = data["video"] as? Bool ?? false
        voteAverage = data["vote_average"] as? Double ?? 0
        voteCount = data["vote_count"] as? Int ?? 0
    }
}

