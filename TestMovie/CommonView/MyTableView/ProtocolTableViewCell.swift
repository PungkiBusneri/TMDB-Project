//
//  ProtocolTableViewCell.swift
//  TestMovie
//
//  Created by Pungki Busneri on 21/02/24.
//

import Foundation

protocol MoviesProtocol {
    var title: String { get }
    var releaseDate: String { get }
    var posterPath: String { get }
    var genreIDS: [Int] { get }
}

extension MovieList: MoviesProtocol {}
extension MovieWithGenreModel: MoviesProtocol {}


