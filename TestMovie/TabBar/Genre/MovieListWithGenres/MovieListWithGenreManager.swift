//
//  MovieListWithGenreManager.swift
//  TestMovie
//
//  Created by Pungki Busneri on 20/02/24.
//

import Foundation

final class  MovieListWithGenreManager {
    typealias Completion<T> = (_ data: T?, _ error: String?, _ statusCode: Int?) -> Void
    
    static func moviesWithGenresHandler(page: Int, genreID: Int, completion: @escaping (Completion <[MovieWithGenreModel]> )) {
        NetworkService.request(endpoint: .moviesWithGenre(page: page, genreId: genreID)) { data, error, statusCode in
            var movieListData = [MovieWithGenreModel]()
            
            if error != nil {
               completion(nil, error, statusCode)
            } else {
                guard let result = data?["results"].arrayObject as? [[String: Any]] else { return }
                
                for i in result {
                    let movieList = MovieWithGenreModel (data: i)
                    movieListData.append(movieList)
                }
                completion(movieListData, error, nil)
            }
        }
    }
}
