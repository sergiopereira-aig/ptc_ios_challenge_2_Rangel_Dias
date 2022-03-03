//
//  AppCoordinator.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

/// Main app coordinator
final class AppCoordinator: BaseCoordinator {
    
    //MARK: -> Properties
    private let router: Router
    
    private let coordinatorFactory: CoordinatorFactory
 
    //MARK:  -> Initialize
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start() {
        runMainFlow()
    }
    
    private func runMainFlow(){
        let coordinator = coordinatorFactory.makeHomeCoordinator(router)
        addChild(coordinator)
        coordinator.start()
    }
}
