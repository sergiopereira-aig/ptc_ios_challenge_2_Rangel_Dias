//
//  ViewCoding.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

protocol ViewCoding {
    
    func buildViewHierarchy()

    func setupConstraints()

    func setupAdditionalConfiguration()

    func setupView()
}


extension ViewCoding {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    func setupAdditionalConfiguration() {}
}
