//
//  BaseCoordinator.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

/// Base coordinator
class BaseCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {}
    
    func addChild(_ coordinator: Coordinator) {
      guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
      childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator?) {
      
      guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
      
      if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
          coordinator.childCoordinators
              .filter({ $0 !== coordinator })
              .forEach({ coordinator.removeChild($0) })
      }
        
      for (index, element) in childCoordinators.enumerated() where element === coordinator {
          childCoordinators.remove(at: index)
          break
      }
    }
}
