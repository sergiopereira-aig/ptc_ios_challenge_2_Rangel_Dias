//
//  FeedHeaderCell.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

final class FeedHeaderView: UIView {
    
    //MARK: -> Views
    lazy var tagView: TagFeedView = {
       return TagFeedView()
    }()
    
    lazy var labelHeader: UILabel = {
       let l = UILabel()
        l.numberOfLines = .zero
        l.font = .boldSystemFont(ofSize: 16)
        l.textAlignment = .left
        return l
    }()
    
    lazy var followButton: UIButton = {
        let b = UIButton()
        b.backgroundColor = .orange
        b.setTitle("FOLLOW", for: .normal)
        b.layer.cornerRadius = 5
        b.titleLabel?.font = .boldSystemFont(ofSize: 12)
        return b
    }()
    
    //MARK: -> Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(_ model: FeedHeaderModel) {
        tagView.config(tag: model.tag)
        labelHeader.text = model.title
        followButton.isHidden = model.sellerProfileLink == nil
    }
}

//MARK: -> View coding
extension FeedHeaderView: ViewCoding {
    func buildViewHierarchy() {
        addSubview(tagView)
        addSubview(labelHeader)
        addSubview(followButton)
    }
    
    func setupConstraints() {
        tagView
            .anchorHorizontal(left: leftAnchor)
            .anchorVertical(top: topAnchor, topConstant: 15)
            .anchorSize( heightConstant: 20)
        
        labelHeader
            .anchorHorizontal(left: leftAnchor, right: followButton.leftAnchor, rightConstant: 12)
            .anchorVertical(top: tagView.topAnchor, bottom: bottomAnchor, topConstant: 30, bottomConstant: 15)
        
        followButton
            .anchorHorizontal(right: rightAnchor)
            .anchorVertical(top: topAnchor, topConstant: 15)
            .anchorSize(widthConstant: 70, heightConstant: 35)
    }
}
