//
//  FeedTarget.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

enum FeedTarget {
    case list
}

extension FeedTarget: NetworkTarget {
    var path: String {
        switch self {
        case .list:
            return "list"
        }
    }
    
    var method: Method {
        switch self {
        case .list:
            return .get
        }
    }
    
    var header: [String : String]? {
       return [:]
    }
}
