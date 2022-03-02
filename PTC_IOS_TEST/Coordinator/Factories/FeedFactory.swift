//
//  FeedFactory.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation
import UIKit

protocol FeedFactoryProtocol {
    func makeController(router: Router) -> UIViewController
}

protocol FeedView: UIView {
    func setupView()
    func didFetchData(_ models: [FeedModel])
}

protocol FeedViewModelProtocol {
    var view: FeedView? { get set }
    var isFirtLoad: Bool { get }
    var stillHasData: Bool { get }
    var isFetching: Bool { get }
    
    func fetchNewData()
    func fetchOldData()
    func routeToSeller(_ deepLink: String?)
}

struct FeedFactory: FeedFactoryProtocol {
    func makeController(router: Router) -> UIViewController {
        let viewModel = FeedViewModel()
        let view = FeedScreenView(viewModel: viewModel)
        
        viewModel.routeToDeepLink = { link in
            router.push(DefaultViewController(), animated: true)
        }
        viewModel.view = view
        
        let vc = FeedViewController(feedView: view)
        return vc
    }
}
