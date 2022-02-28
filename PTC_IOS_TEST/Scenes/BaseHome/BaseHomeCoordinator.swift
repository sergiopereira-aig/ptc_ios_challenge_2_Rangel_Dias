//
//  BaseHomeCoordinator.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation
import UIKit

final class BaseHomeCoordinator: BaseCoordinator {
    
    //MARK:  -> Propertis
    private let factory: BaseHomeFactory
    private let router: Router
    
    //MARK:  -> Initialize
    init(router: Router, factory: BaseHomeFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showHome()
    }
    
    private func showHome() {
        let controllers: [UIViewController] = [
            DefaultViewController(),
            DefaultViewController(),
            FeedFactory().makeController(),
            DefaultViewController(),
            DefaultViewController()
        ]
        
        let icons: [String] = [
           "house",
           "list.dash.header.rectangle",
           "scroll",
           "person",
           "point.3.connected.trianglepath.dotted"
        ]
        
        let baseHomeController = factory.makeController(controllers, icons)
        router.setRootScene(baseHomeController, hideBar: false)
    }
}
