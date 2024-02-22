//
//  UpComingManager.swift
//  TestMovie
//
//  Created by Pungki Busneri on 04/02/24.
//

final class UpComingManager {
    typealias Completion<T> = (_ data: T?, _ error: String?, _ statusCode: Int?) -> Void
    
    static func upComingHandler(page: Int, completion: @escaping (Completion<[UpComingModel]>)) {
        NetworkService.request(endpoint: .upComing(page: page)) { data, error, statusCode in
            
            var upComingData = [UpComingModel]()
            
            if let error = error {
                completion(nil, error, statusCode)
            } else {
                guard let upComingMovies = data? ["results"].arrayObject as? [ [String: Any]]else { return }
                
                for i in upComingMovies {
                    let upComing = UpComingModel(data: i)
                    upComingData.append(upComing)
                }
                completion(upComingData, nil, statusCode)
            }
        }
    }
}
    
