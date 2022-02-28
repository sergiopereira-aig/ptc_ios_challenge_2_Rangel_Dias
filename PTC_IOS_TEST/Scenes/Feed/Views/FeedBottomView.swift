//
//  FeedBottomView.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

final class FeedBottomView: UIView {
    
    //MARK: -> Views
    lazy var bottomLabel: UILabel = {
       let l = UILabel()
        l.numberOfLines = .zero
        l.font = .systemFont(ofSize: 16)
        l.textAlignment = .left
        return l
    }()
    
    lazy var dateLabel: UILabel = {
       let l = UILabel()
        l.numberOfLines = .zero
        l.font = .systemFont(ofSize: 13)
        l.textAlignment = .left
        l.textColor = .lightGray
        return l
    }()
    
    lazy var shareButton: UIButton = {
        let b = UIButton()
        b.titleLabel?.font = .systemFont(ofSize: 14)
        b.setTitleColor(.orange, for: .normal)
        b.setTitle("SHARE", for: .normal)
        b.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        b.imageView?.tintColor = .orange
        b.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        return b
    }()
    
    private var dateTopToSuperview: NSLayoutConstraint?
    private var dateTopToBottomLabel: NSLayoutConstraint?
    
    //MARK: -> Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(bottomDescription: String?, date: String) {
        bottomLabel.text = bottomDescription
        let hasBottomLabel = bottomDescription != nil
        bottomLabel.isHidden = !hasBottomLabel
        
        dateLabel.text = date
        dateTopToSuperview?.isActive = !hasBottomLabel
        dateTopToBottomLabel?.isActive = hasBottomLabel
    }

}

//MARK: -> View coding
extension FeedBottomView: ViewCoding {
    func buildViewHierarchy() {
        addSubview(bottomLabel)
        addSubview(dateLabel)
        addSubview(shareButton)
    }
    
    func setupConstraints() {
        bottomLabel
            .anchorHorizontal(left: leftAnchor, right: rightAnchor)
            .anchorVertical(top: topAnchor, topConstant: 15)
            
        dateLabel
            .anchorHorizontal(left: leftAnchor, right: shareButton.leftAnchor, rightConstant: 15)
            .anchorVertical(bottom: bottomAnchor, bottomConstant: 15)
        
        dateTopToSuperview = NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20)
        dateTopToSuperview?.isActive = false
        dateTopToBottomLabel = NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: bottomLabel, attribute: .bottom, multiplier: 1.0, constant: 15)
       
        shareButton
            .anchorHorizontal(right: rightAnchor)
            .anchorVertical(bottom: bottomAnchor, bottomConstant: 15)
            .anchorSize(widthConstant: 80, heightConstant: 20)
    }
}
