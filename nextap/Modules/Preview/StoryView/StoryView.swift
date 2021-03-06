//
//  StoryView.swift
//  nextap
//
//  Created by Tomáš Černý on 15/09/2020.
//  Copyright © 2020 Tomáš Černý. All rights reserved.
//

import UIKit

class StoryView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    
    private unowned var presenter : PreviewPresenter?
    
    class func instanceFromNib(presenter: PreviewPresenter) -> StoryView {
        let view = UINib(nibName: "Story", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! StoryView
        view.presenter = presenter
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //set round user imageView
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.width / 2.0
        
        //set top and bottom grey->white gradient
        setGradient()
    }
    
    func setGradient() {
        
        self.imageView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
                
        let width = self.bounds.width
        let height = self.bounds.height
        let shadow = UIColor.black.withAlphaComponent(0.3).cgColor

        // Add gradient bar for image on top
        let topImageGradient = CAGradientLayer()
        topImageGradient.frame = CGRect(x: 0, y: 0, width: width, height: Constants.gradientHeight)
        topImageGradient.colors = [shadow, UIColor.clear.cgColor]
        imageView.layer.insertSublayer(topImageGradient, at: 0)

        let bottomImageGradient = CAGradientLayer()
        bottomImageGradient.frame = CGRect(x: 0, y: height - Constants.gradientHeight, width: width, height: Constants.gradientHeight)
        bottomImageGradient.colors = [UIColor.clear.cgColor, shadow]
        imageView.layer.insertSublayer(bottomImageGradient, at: 0)
    }
    
    func configureWithStory(story: Story) {
        if let storyImageUrl = URL(string: story.coverSrc) {
            imageView.af.setImage(withURL: storyImageUrl, placeholderImage: #imageLiteral(resourceName: "imagePlaceholder"))
        } else {
            imageView.image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        
        if let userImageUrl = URL(string: story.user.avatarImageUrl) {
            userImageView.af.setImage(withURL: userImageUrl, placeholderImage: #imageLiteral(resourceName: "imagePlaceholder"))
        } else {
            userImageView.image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        
        userLabel.text = story.user.displayName
    }
    
    @IBAction func dismissButtonTouched(_ sender: Any) {
        self.presenter?.dismissButtonTouched()
    }
    
}
