//
//  BaseHomeFactory.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation
import UIKit

struct BaseHomeFactory {
    
    func makeController(_ controllers: [UIViewController], _ icons: [String]) -> UIViewController {
        return BaseHomeViewController(controllers, icons)
    }
}
