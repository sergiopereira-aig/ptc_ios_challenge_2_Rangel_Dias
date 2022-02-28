//
//  CoordinatorOutput.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation


protocol CoordinatorOutput: Coordinator {
    var finishFlow: (() -> Void)? { get set }
}
