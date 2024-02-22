//
//  GenreManager.swift
//  TestMovie
//
//  Created by Pungki Busneri on 31/01/24.
//

import Foundation

final class GenreManager {
    typealias Completion<T> = (_ data: T?, _ error: String?, _ statusCode: Int?) -> Void
    
    static func topRatedHandler(page: Int, completion: @escaping (Completion<[TopRated]>)) {
        NetworkService.request(endpoint: .topRating(page: page)) { data, error, statusCode in
            var topRatedData = [TopRated]()
            
            if let error = error {
                completion(nil, error, statusCode)
            } else {
                guard let movies = data?["results"].arrayObject as? [[String: Any]] else { return }
                
                for movie in movies {
                    let topRated = TopRated(data: movie)
                    topRatedData.append(topRated)
                }
                completion(topRatedData, nil, statusCode)
            }
        }
    }
}
