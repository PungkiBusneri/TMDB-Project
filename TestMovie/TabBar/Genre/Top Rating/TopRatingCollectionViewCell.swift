//
//  TopRatingCollectionViewCell.swift
//  TestMovie
//
//  Created by Pungki Busneri on 03/02/24.
//

import UIKit

class TopRatingCollectionViewCell: UICollectionViewCell {
    @IBOutlet var moviesImage: UIImageView!
    @IBOutlet var view: UIView!
    @IBOutlet var moviesRate: UILabel!
    @IBOutlet var movieTitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        moviesImage.layer.cornerRadius = moviesImage.frame.height/20.5
        moviesImage.layer.shadowOffset =  CGSize(width: 0, height: 4.0)
        moviesImage.layer.shadowColor = UIColor.systemMint.cgColor
        moviesImage.layer.shadowRadius = 4.0
        moviesImage.layer.shadowOpacity = 1.0
        moviesImage.layer.masksToBounds = true
        
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
    }
    func setupCell(topRate: TopRated) {
        moviesRate.text = "\(topRate.voteAverage)"
        movieTitle.text = "\(topRate.title)"
        moviesImage.setImage(with: ImageUrl.Poster + topRate.posterPath)
    }
}
