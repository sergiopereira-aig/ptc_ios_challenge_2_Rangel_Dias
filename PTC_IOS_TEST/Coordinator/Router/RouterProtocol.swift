//
//  RouterProtocol.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

/// Defines methods for navigatin
protocol RouterProtocol: Presentable {
  func present(_ scene: Presentable?)
  func present(_ scene: Presentable?, animated: Bool)
  
  func push(_ scene: Presentable?, animated: Bool)
  func push(_ scene: Presentable?, animated: Bool, completion: (() -> Void)?)
  func push(_ scene: Presentable?, animated: Bool, hideNavBar: Bool, completion: (() -> Void)?)
    
  func popScene()
  func popScene(animated: Bool)
  
  func dismissScene()
  func dismissScene(animated: Bool, completion: (() -> Void)?)
  
  func setRootScene(_ scene: Presentable?, hideBar: Bool)
  
  func popToRootScene(animated: Bool)
}
