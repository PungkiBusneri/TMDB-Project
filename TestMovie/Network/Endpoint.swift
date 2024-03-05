//
//  Endpoint.swift
//  TestMovie
//
//  Created by Pungki Busneri on 27/10/23.
//

import Foundation
import Moya

enum Endpoint {
    case nowPlaying(page: Int)
    case genre
    case movieDetails(movieId: Int)
    case credits(movieId: Int)
    case topRating(page: Int)
    case upComing(page: Int)
    case moviesWithGenre(page: Int, genreId: Int)
    case onTrending(timeWindow: String)
    case popularActor(page: Int)
}

extension Endpoint {
    var parameters: [String: Any] {
        switch self {
        case .nowPlaying(let page):
            return ["page": page]
        case .topRating(let page):
            return ["page": page]
        case .moviesWithGenre(let page, let genreId):
            return ["page": page, "with_genres": genreId]
        case .popularActor(let page):
            return ["page": page]
//        case .onTrending(let timeWindow):
//            return ["time_window": timeWindow]
        default:
            return[:]
        }
    }
}
extension Endpoint: TargetType {
    var baseURL: URL {
        switch self {
        default:
            return URL(string: Constant.apiBaseUrl)!
        }
    }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "movie/now_playing"
        case .genre:
            return "genre/movie/list"
        case .movieDetails(let movieId):
            return "movie/\(movieId)"
        case .credits(let movieId):
            return "movie/\(movieId)/credits"
        case .topRating:
            return "movie/top_rated"
        case .upComing:
            return "movie/upcoming"
        case .moviesWithGenre:
            return "discover/movie"
        case .onTrending(let timeWindow):
            return "trending/movie/\(timeWindow)"
        case .popularActor:
            return "person/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .nowPlaying:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .topRating:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .upComing:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case .popularActor:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer \(Constant.accessToken)"
        ]
        switch self {
        default:
            return headers
        }
    }
}
