//
//  UpComingModel.swift
//  TestMovie
//
//  Created by Pungki Busneri on 04/02/24.
//

import Foundation

struct UpComingModel {
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
    let dateRange: DateRange
    var genres: [Genre]


    init(data: [String: Any]) {
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

        if let datesData = data["dates"] as? [String: Any] {
            dateRange = DateRange(data: datesData)
        } else {
            dateRange = DateRange(maximum: "", minimum: "")
        }

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

struct DateRange {
    let maximum: String
    let minimum: String
    
    init(data: [String: Any]) {
        maximum = data["maximum"] as? String ?? ""
        minimum = data["minimum"] as? String ?? ""
    }

    init(maximum: String, minimum: String) {
        self.maximum = maximum
        self.minimum = minimum
    }
}
