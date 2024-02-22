//
//  MyTableViewCell.swift
//  TestMovie
//
//  Created by Pungki Busneri on 06/10/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet var imageMovieView: UIImageView!
    @IBOutlet var labelTitleMovie: UILabel!
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelGenre: UILabel!
    
    private var genres: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        imageMovieView.layer.cornerRadius = 4
        imageMovieView.layer.cornerRadius = imageMovieView.frame.height/3.5
        imageMovieView.layer.shadowOffset =  CGSize(width: 0, height: 4.0)
        imageMovieView.layer.shadowColor = UIColor.systemMint.cgColor
        imageMovieView.layer.shadowRadius = 4.0
        imageMovieView.layer.shadowOpacity = 1.0
    }
    func setupCell(movie: MoviesProtocol, genre: [Genre]) {

        
        labelTitleMovie.text = movie.title
        labelDate.text = dateFormat(from: movie.releaseDate)
        imageMovieView.setImage(with: ImageUrl.Poster + movie.posterPath)
        
//        MARK: For only first genre
//        if let firstGenreId = movie.genreIDS.first,
//                   let firstGenre = genre.first(where: { $0.id == firstGenreId }) {
//                    labelGenre.text = firstGenre.name
//                } else {
//                    labelGenre.text = "Unknown Genre"
//                }
//            }
//        }
        
// MARK:  This kode for many genre name.
        
        for id in movie.genreIDS {
            for (index, item) in genre.enumerated() {
                if id == item.id {
                    self.genres.append(genre[index].name)
                }
            }
        }
        labelGenre.text = self.genres.joined(separator: ", ")
    }
}


