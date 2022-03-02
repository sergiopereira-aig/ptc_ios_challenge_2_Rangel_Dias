//
//  FeedImageView.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

final class FeedImageView: UIImageView {
    
    enum State {
        case seeMore
        case normal
    }
    
    //MARK: -> Views
    lazy var coverLayer: UIView = {
        let c = UIView()
        c.isHidden = true
        c.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return c
    }()
    
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 1
        l.textColor = .white
        l.text = "SEE ALL"
        l.font = .systemFont(ofSize: 16)
        return l
    }()
    
    var state: State = .normal {
        didSet {
            coverLayer.isHidden = state == .normal
        }
    }
    
    //MARK: -> Init
    required init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -> View coding
extension FeedImageView: ViewCoding {
    func buildViewHierarchy() {
        coverLayer.addSubview(titleLabel)
        
        addSubview(coverLayer)
    }
    
    func setupConstraints() {
        titleLabel.anchorCenterToSuperview()
        
        coverLayer.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
}
