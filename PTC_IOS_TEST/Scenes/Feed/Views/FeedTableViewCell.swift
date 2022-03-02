//
//  FeedTableViewCell.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

///
typealias FeedTapImageCallback = ((String?) -> Void)

class FeedTableViewCell: UITableViewCell {
    
    //MARK: -> Views
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
    
    //MARK: -> Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(_ feedModel: FeedModel, didTapCellCallback: FeedTapImageCallback?) {
        header.config(feedModel.header)
        imagesContentView.config(feedModel.images, deepLink: feedModel.deepLink, tag: feedModel.header.tag, didTapImageCallback: didTapCellCallback)
        bottomView.config(bottomDescription: feedModel.description, date: feedModel.date)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imagesContentView.prepareForReuse()
        bottomView.prepareForReuse()
    }
}

//MARK: -> View coding
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
    
    //MARK: -> Views
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
        return img
    }()
    
    lazy var rightImgView: FeedImageView = {
        let img = FeedImageView()
        img.contentMode = .scaleToFill
        return img
    }()
    
    lazy var customImagesDisplay: CustomImagesDisplay = {
        return CustomImagesDisplay()
    }()
    
    //MARK: -> Properties
    var deepLink: String?
    var didTapOnImages: FeedTapImageCallback?
    
    //MARK: -> Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        hStack.addArrangedSubview(leftImgView)
        hStack.addArrangedSubview(rightImgView)
        
        addSubview(hStack)
    }
    
    func setupConstraints() {
        let margin = 35.0
        let spaceBetweenImages = 10.0
        let unavaiableSpace: CGFloat = margin + spaceBetweenImages
        let size: CGFloat = (UIScreen.main.bounds.width - unavaiableSpace) / 3.0
        
        
        leftImgView.anchorSize(heightConstant: size)
        rightImgView.anchorSize(heightConstant: size)
        
        hStack.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImages))
        hStack.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapImages() {
        didTapOnImages?(deepLink)
    }
    
    func config(_ images: [String], deepLink: String?, tag: Tag, didTapImageCallback: FeedTapImageCallback?) {
        didTapOnImages = didTapImageCallback
        
        ///Should make a logic in case there was not just 3 images
        leftImgView.loadImage(from: images[0])
        rightImgView.loadImage(from: images[2])
        
        if tag == .recommendedSeller {
            customImagesDisplay.isHidden = false
            middleImgView.isHidden = true
            hStack.insertArrangedSubview(customImagesDisplay, at: 1)
            customImagesDisplay.config(images)
        } else {
            customImagesDisplay.isHidden = true
            middleImgView.isHidden = false
            hStack.insertArrangedSubview(middleImgView, at: 1)
            middleImgView.loadImage(from: images[1])
        }
        
        rightImgView.state = .seeMore
        
        self.deepLink = deepLink
    }
    
    func prepareForReuse() {
        hStack.removeArrangedSubview(customImagesDisplay)
        hStack.removeArrangedSubview(middleImgView)
    }
}

fileprivate class CustomImagesDisplay: UIView, ViewCoding {
    
    //MARK: -> Views
    lazy var hStack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .fillEqually
        s.alignment = .fill
        s.isUserInteractionEnabled = true
        s.spacing = 2
        return s
    }()
    
    lazy var vStack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = .fillEqually
        s.alignment = .fill
        s.isUserInteractionEnabled = true
        s.spacing = 2
        return s
    }()
    lazy var leftImgView: FeedImageView = {
        let img = FeedImageView()
        img.contentMode = .scaleToFill
        return img
    }()
    
    lazy var rightImgView: FeedImageView = {
        let img = FeedImageView()
        img.contentMode = .scaleToFill
        return img
    }()
    
    lazy var bottomImgView: FeedImageView = {
        let img = FeedImageView()
        img.contentMode = .scaleToFill
        return img
    }()
    
    //MARK: -> Init
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -> View coding
    func buildViewHierarchy() {
        hStack.addArrangedSubview(leftImgView)
        hStack.addArrangedSubview(rightImgView)
        
        vStack.addArrangedSubview(hStack)
        vStack.addArrangedSubview(bottomImgView)
        
        addSubview(vStack)
    }
    
    func setupConstraints() {
        vStack.fillSuperview()
    }
    
    func config(_ images: [String]) {
        leftImgView.loadImage(from: images[0])
        rightImgView.loadImage(from: images[1])
        bottomImgView.loadImage(from: images[2])
    }
}
