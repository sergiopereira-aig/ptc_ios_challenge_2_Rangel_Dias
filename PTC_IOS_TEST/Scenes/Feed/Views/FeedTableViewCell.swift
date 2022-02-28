//
//  FeedTableViewCell.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    lazy var header: FeedHeaderView = {
        return FeedHeaderView()
    }()
    
    fileprivate lazy var imagesContentView: ImagesContentView = {
        return ImagesContentView()
    }()
    
    lazy var bottomView: FeedBottomView = {
        return FeedBottomView()
    }()
    
    lazy var vstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    lazy var bgView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 5
        return v
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(_ feedModel: FeedModel) {
        header.config(feedModel.header)
        imagesContentView.config(feedModel.images)
        bottomView.config(bottomDescription: feedModel.description, date: feedModel.date.toString())
    }
}

extension FeedTableViewCell: ViewCoding {
    func buildViewHierarchy() {
        vstack.addArrangedSubview(header)
        vstack.addArrangedSubview(imagesContentView)
        vstack.addArrangedSubview(bottomView)
        
        bgView.addSubview(vstack)
        contentView.addSubview(bgView)
    }
    
    func setupConstraints() {
        bgView.fillSuperview(top: 15, bottom: 0, left: 15, right: 15)
        vstack.fillSuperview(left: 15, right: 15)
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = UIColor.clear
    }
}


fileprivate class ImagesContentView: UIView, ViewCoding {
    
    lazy var hStack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .fillEqually
        s.alignment = .fill
        s.isUserInteractionEnabled = true
        s.spacing = 5
        return s
    }()
    
    lazy var leftImgView: FeedImageView = {
        let img = FeedImageView()
        img.contentMode = .scaleToFill
        return img
    }()
    
    lazy var middleImgView: FeedImageView = {
        let img = FeedImageView()
        img.contentMode = .scaleToFill
        img.backgroundColor = .yellow
        return img
    }()
    
    lazy var rightImgView: FeedImageView = {
        let img = FeedImageView()
        img.contentMode = .scaleToFill
        return img
    }()
    
    var didTapOnImages: (() -> Void)?
    
    init(didTapOnImages: (() -> Void)? = nil) {
        self.didTapOnImages = didTapOnImages
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        hStack.addArrangedSubview(leftImgView)
        hStack.addArrangedSubview(middleImgView)
        hStack.addArrangedSubview(rightImgView)
        
        addSubview(hStack)
    }
    
    func setupConstraints() {
        let margin = 35.0
        let spaceBetweenImages = 10.0
        let unavaiableSpace: CGFloat = margin + spaceBetweenImages
        let size: CGFloat = (UIScreen.main.bounds.width - unavaiableSpace) / 3.0
        
        
        leftImgView.anchorSize(heightConstant: size)
        middleImgView.anchorSize(heightConstant: size)
        rightImgView.anchorSize(heightConstant: size)
        
        hStack.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImages))
        hStack.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapImages() {
        didTapOnImages?()
    }
    
    func config(_ images: [String]) {
        leftImgView.loadFromURL(imgUrl: images[0])
        middleImgView.loadFromURL(imgUrl: images[1])
        rightImgView.loadFromURL(imgUrl: images[2])
        
        rightImgView.state = .seeMore
    }
}
