//
//  MainManager.swift
//  TestMovie
//
//  Created by Pungki Busneri on 28/02/24.
//

import Foundation

struct MainManager {
    typealias  Completion<T> = (_ data: T?,_ error: String?,_ statusCode: Int?) -> Void
    
    static func topActorAndActrisHandler(page: Int, completion: @escaping (Completion<[TopActorAndActris]> )) {
        NetworkService.request(endpoint: .popularActor(page: page)) { data, error, statusCode in
            var allActorData = [TopActorAndActris]()
            
            if error != nil {
                completion(nil, error, statusCode)
            } else {
                guard let results = data?["results"].arrayObject as? [[String: Any]] else { return }
                for i in results {
                    let onTop = TopActorAndActris(data: i)
                    allActorData.append(onTop)
                }
                completion(allActorData, nil, statusCode)
            }
        }
    }
    static func onTrendingMoviesHandler(timeWindow: String, completion: @escaping(Completion<[OnTrendingMovies]>)) {
        NetworkService.request(endpoint: .onTrending(timeWindow: timeWindow)) { data, error, statusCode in
            var onTrendingMovies = [OnTrendingMovies]()
            
            if error != nil {
                completion(nil, error, statusCode)
            } else {
                guard let results = data?["results"].arrayObject as? [[String: Any]] else { return }
                for i in results {
                    let onTrending = OnTrendingMovies(data: i)
                    onTrendingMovies.append(onTrending)
                }
                completion(onTrendingMovies, nil, statusCode)
            }
        }
    }
}


