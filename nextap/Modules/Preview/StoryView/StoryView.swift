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
    
    class func instanceFromNib(presenter: PreviewPresenter, frame: CGRect) -> StoryView {
        let view = UINib(nibName: "Story", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! StoryView
        view.presenter = presenter
        view.frame = frame
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImageView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = userImageView.frame.width / 2.0
    }
    
    func setImage(url : URL?) {
        if let url = url {
            imageView.af.setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceholder"))
        } else {
            imageView.image = #imageLiteral(resourceName: "imagePlaceholder")
        }
    }
    
    func setUserImage(url : URL?) {
       if let url = url {
            userImageView.af.setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceholder"))
        } else {
            userImageView.image = #imageLiteral(resourceName: "imagePlaceholder")
        }
    }
    
    func setUserLabel(userName: String) {
        userLabel.text = userName
    }
    
    @IBAction func dismissButtonTouched(_ sender: Any) {
        self.presenter?.dismissButtonTouched()
    }
    
}
