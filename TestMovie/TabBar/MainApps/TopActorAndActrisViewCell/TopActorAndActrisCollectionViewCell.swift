//
//  TopActorAndActrisCollectionViewCell.swift
//  TestMovie
//
//  Created by Pungki Busneri on 28/02/24.
//

import UIKit

class TopActorAndActrisCollectionViewCell: UICollectionViewCell {
    @IBOutlet var actorImage: UIImageView!
    @IBOutlet var actorName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        actorName.lineBreakMode = .byWordWrapping
        actorImage.layer.cornerRadius = actorImage.frame.height / 4
        
        actorImage.layer.borderColor = UIColor.lightGray.cgColor
        actorImage.layer.borderWidth  = 2
    }
    func setupCell(topPerson: TopActorAndActris) {
        actorName.text = topPerson.name
        actorImage.setImage(with: ImageUrl.Poster + topPerson.profilePath, failure: {
            self.actorImage.image = UIImage.icDefaultProfile
        })
    }
}
