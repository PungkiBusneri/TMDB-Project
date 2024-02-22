//
//  UpComingTableViewCell.swift
//  TestMovie
//
//  Created by Pungki Busneri on 04/02/24.
//

import UIKit

class UpComingTableViewCell: UITableViewCell {
    @IBOutlet var moviesImage: UIImageView!
    @IBOutlet var moviesTitle: UILabel!
    @IBOutlet var moviesGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func setupCell(movie: UpComingModel) {
        moviesTitle.text = movie.title
        moviesImage.setImage(with: ImageUrl.backdrop + movie.backdropPath)
        
        let genreNames = movie.genres.map { $0.name }
        moviesGenre.text = genreNames.joined(separator: ", ")
    }

}
