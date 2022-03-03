//
//  CoordinatorFactory.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation
import UIKit

struct CoordinatorFactory {
    
    func makeHomeCoordinator(_ router: Router) -> Coordinator {
        return BaseHomeCoordinator(router: router, factory: BaseHomeFactory())
    }
}
