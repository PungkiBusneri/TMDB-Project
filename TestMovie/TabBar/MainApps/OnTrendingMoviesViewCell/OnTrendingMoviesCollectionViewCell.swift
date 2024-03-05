//
//  OnTrendingMoviesCollectionViewCell.swift
//  TestMovie
//
//  Created by Pungki Busneri on 28/02/24.
//

import UIKit

class OnTrendingMoviesCollectionViewCell: UICollectionViewCell {
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        movieImage.layer.cornerRadius = movieImage.frame.height / 6
        

        movieImage.layer.shadowRadius = 1.0
        movieImage.layer.shadowOpacity = 3.0
        movieImage.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        movieImage.layer.shadowColor = UIColor.white.cgColor
        
        movieImage.layer.borderColor = UIColor.lightGray.cgColor
        movieImage.layer.borderWidth = 2
    }
    func setupCellMovies(onMovie: OnTrendingMovies) {
        movieTitle.text = onMovie.title
        movieImage.setImage(with: ImageUrl.Poster + onMovie.posterPath )
    }
}
