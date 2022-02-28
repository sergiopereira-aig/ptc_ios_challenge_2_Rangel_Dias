//
//  FeedModel.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation
import UIKit

enum Tag {
    case recommendSeller
    case newArrivals
    
    var text: String {
        switch self {
        case .recommendSeller:
            return "RECOMMENDED SELLER"
        case .newArrivals:
            return "NEW ARRIVALS"
        }
    }
    
    var color: UIColor {
        switch self {
        case .recommendSeller:
            return .lightGray
        case .newArrivals:
            return .green
        }
    }
}

struct FeedHeaderModel {
    var tag: Tag
    var title: String
    var sellerProfileLink: String?
}

struct FeedModel {
    var id: String
    var header: FeedHeaderModel
    var images: [String]
    var deepLink: String
    var date: Date
    var description: String?
}
