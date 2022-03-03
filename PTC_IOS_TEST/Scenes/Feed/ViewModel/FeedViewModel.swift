//
//  FeedViewModel.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

final class FeedViewModel: FeedViewModelProtocol {
    
    var isFetching: Bool {
        return _isFetching
    }
    
    var isFirtLoad: Bool {
        return page == 0
    }
    
    var stillHasData: Bool {
        return page < 2
    }
   
    var service: FeedService = .init()
    
    weak var view: FeedView?
    
    var routeToDeepLink: ((String?) -> Void)?
    
    private var page: Int = 0
    private var _isFetching: Bool = false
    
    func fetchNewData() {
        _isFetching = true
        service.list(page: 0) { [unowned self] result  in
            self._isFetching = false
            
            switch result {
            case .success(_):
                self.view?.didFetchData([])
            case .error(_):
                ///should handle erro
                break
            }
        }
    }
    
    func fetchOldData() {
        _isFetching = true
        service.list(page: page) { [unowned self] result in
            _isFetching = false
            
            switch result {
            case .success(let models):
                guard let feedModels = models?.feedModels, stillHasData else {
                    self.view?.didFetchData([])
                    page+=1
                    return
                }
                self.view?.didFetchData(feedModels)
                page+=1
            case .error(_):
                ///should handle erro
                break
            }
        }
    }
    
    func routeToSeller(_ deepLink: String?) {
        guard let deepLink = deepLink else {
            return
        }

        routeToDeepLink?(deepLink)
    }
}
