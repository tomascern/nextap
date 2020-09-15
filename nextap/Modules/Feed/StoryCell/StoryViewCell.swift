//
//  StoryViewCell.swift
//  nextap
//
//  Created by Tomáš Černý on 14/09/2020.
//  Copyright © 2020 Tomáš Černý. All rights reserved.
//

import UIKit
import AlamofireImage

class StoryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.af.cancelImageRequest()
        imageView.layer.removeAllAnimations()
        imageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = Constants.feedImagesRadius
    }
    
    func configure(with story: Story) {
        label.text = story.user.displayName
        
        if let imageUrl = URL(string: story.coverSrc) {
            imageView.af.setImage(withURL: imageUrl, placeholderImage: #imageLiteral(resourceName: "imagePlaceholder"))
        } else {
            imageView.image = #imageLiteral(resourceName: "imagePlaceholder")
        }
    }
}
