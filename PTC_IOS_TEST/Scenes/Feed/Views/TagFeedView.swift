//
//  TagFeedView.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

final class TagFeedView: UIView {
    
    //MARK: -> Views
    lazy var labelHeader: UILabel = {
       let l = UILabel()
        l.numberOfLines = 1
        l.font = .systemFont(ofSize: 14)
        l.textAlignment = .center
        return l
    }()
    
    //MARK: -> Properties
    private var text: String?
    private var bgColor: UIColor?
    
    
    init(text: String, backgroundColor: UIColor) {
        self.text = text
        self.bgColor = backgroundColor
        super.init(frame: .zero)
        setupView()
    }
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(text: String, textColor: UIColor, backgroundColor: UIColor) {
        self.backgroundColor = bgColor
        self.labelHeader.text = text
        self.labelHeader.textColor = textColor
    }
    
    func config(tag: Tag) {
        self.backgroundColor = tag.color
        self.labelHeader.text = tag.text
    }
}

//MARK: -> View coding
extension TagFeedView: ViewCoding {
    
    func buildViewHierarchy() {
        addSubview(labelHeader)
    }
    
    func setupConstraints() {
        labelHeader
            .fillSuperview(top: 5, bottom: 5,left: 5, right: 5)
    }
    
    func setupAdditionalConfiguration() {
        layer.cornerRadius = 2
    }
}
