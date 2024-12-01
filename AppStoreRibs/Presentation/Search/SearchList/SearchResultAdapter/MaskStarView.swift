//
//  MaskStarView.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/1/24.
//

import Foundation
import UIKit


class MaskStarView : UIView {
    lazy private var starImage : UIImageView = {
        let star = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image:star)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        imageView.mask = maskingView
        return imageView
    }()
    
    private let maskLayer : CALayer = {
        let maskLayer = CALayer()
        maskLayer.backgroundColor = UIColor.white.cgColor
        return maskLayer
    }()
    
    lazy private var maskingView : UIImageView = {
        let star = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: star)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.tintColor = .gray
        imageView.layer.addSublayer(maskLayer)
        return imageView
    }()
    
    var rating : CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        maskingView.frame = starImage.bounds
        maskLayer.frame = maskingView.bounds
        maskLayer.frame.size.width = self.frame.width * rating
    }
}
extension MaskStarView {
    private func setLayout(){
        self.addSubview(starImage)
        
        NSLayoutConstraint.activate([
            starImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            starImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            starImage.widthAnchor.constraint(equalTo: self.widthAnchor),
            starImage.heightAnchor.constraint(equalTo: self.heightAnchor)
            
        ])
    }
}
