//
//  NetworkTarget.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

enum Method: String {
    case post = "POST"
    case get = "GET"
}

/// Base target request
protocol Target {
    
    var baseURL: URL { get }
    
    var path: String { get }
    
    var method: Method { get }
    
    var header: [String: String]? { get }
}

protocol NetworkTarget: Target { }

extension NetworkTarget {
    
    var baseURL: URL { URL(string: "google.com")! }
    
    var header: [String : String]? { ["Content-Type": "application/json"] }
}
