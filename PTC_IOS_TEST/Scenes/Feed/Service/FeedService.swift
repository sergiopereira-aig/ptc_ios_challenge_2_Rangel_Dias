//
//  FeedService.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

protocol FeedServiceProtocol: NetworkService {
    func list(page: Int, handle: @escaping ServiceCompletion<FeedResponse>)
}

class FeedService: FeedServiceProtocol {
    typealias Target = FeedTarget
    
    func list(page: Int, handle: @escaping ServiceCompletion<FeedResponse>) {
        let mock = page == 0 ? MockData.feedJsonResponse : MockData.feedJsonResponse2
        
        guard let data = mock.data(using: .utf8) else { return }
        
        let result = try? FeedResponse.decode(from: data)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            handle(.success(result))
        }
        
        ///Real request
        //request(target: .list, then: handle)
    }
}
