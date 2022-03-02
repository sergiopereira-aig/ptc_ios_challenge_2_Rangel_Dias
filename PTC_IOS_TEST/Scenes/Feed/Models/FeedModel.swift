//
//  FeedModel.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation
import UIKit

///Feed models
enum Tag: String, Decodable {
    case recommendedSeller = "RECOMMENDED SELLER"
    case newArrivals = "NEW ARRIVALS"
    case none = "NONE TAG"
    
    var color: UIColor {
        switch self {
        case .recommendedSeller:
            return UIColor(red: 164/255.0, green: 163/255.0, blue: 183/255.0, alpha: 1.0)
        case .newArrivals:
            return UIColor(red: 98/255.0, green: 205/255.0, blue: 134/255.0, alpha: 1.0)
        case .none:
            return UIColor(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        }
    }
}

struct FeedHeaderModel: Decodable {
    var tag: Tag
    var title: String
    var sellerProfileLink: String?
}

struct FeedModel: Decodable {
    var id: String
    var header: FeedHeaderModel
    var images: [String]
    var deepLink: String
    var date: String
    var description: String?

    private enum CodingKeys: String, CodingKey  {
        case id = "id"
        case header = "header"
        case images = "images"
        case deepLink = "deepLink"
        case date = "date"
        case description = "description"
    }
}

struct FeedResponse: Decodable {
    var feedModels: [FeedModel]
}
