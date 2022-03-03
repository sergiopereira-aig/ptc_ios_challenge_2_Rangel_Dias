//
//  Router.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

/// class responsible for navigation
class Router: NSObject, RouterProtocol{

    private weak var rootController: UINavigationController?
    private var completions: [UIViewController : () -> Void]
    
    //MARK: -> Initialize
    init(rootController: UINavigationController) {
        self.rootController = rootController
        completions = [:]
        super.init()
        setAddtionalConfing()
    }
    
    private func setAddtionalConfing() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 40/255.0, green: 40/255.0, blue: 40/255.0, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    func toPresent() -> UIViewController? {
      return rootController
    }
    
    func present(_ scene: Presentable?) {
      present(scene, animated: true)
    }
    
    func present(_ scene: Presentable?, animated: Bool) {
      guard let controller = scene?.toPresent() else { return }
      rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func dismissScene() {
      dismissScene(animated: true, completion: nil)
    }
    
    func dismissScene(animated: Bool, completion: (() -> Void)?) {
      rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func push(_ scene: Presentable?, animated: Bool)  {
      push(scene, animated: animated, completion: nil)
    }
    
    func push(_ scene: Presentable?, animated: Bool, completion: (() -> Void)?) {
        guard
          let controller = scene?.toPresent(),
          (controller is UINavigationController == false)
          else { assertionFailure("Deprecated push UINavigationController."); return }
        
        if let completion = completion {
          completions[controller] = completion
        }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func push(_ scene: Presentable?, animated: Bool, hideNavBar: Bool, completion: (() -> Void)?) {
      guard
        let controller = scene?.toPresent(),
        (controller is UINavigationController == false)
        else { assertionFailure("Deprecated push UINavigationController."); return }
      
      if let completion = completion {
        completions[controller] = completion
      }
      rootController?.isNavigationBarHidden = hideNavBar
      rootController?.pushViewController(controller, animated: animated)
    }
    
    func popScene()  {
      popScene(animated: true)
    }
    
    func popScene(animated: Bool)  {
      if let controller = rootController?.popViewController(animated: animated) {
        runCompletion(for: controller)
      }
    }
    
    func setRootScene(_ scene: Presentable?, hideBar: Bool) {
      guard let controller = scene?.toPresent() else { return }
      rootController?.setViewControllers([controller], animated: false)
      rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRootScene(animated: Bool) {
      if let controllers = rootController?.popToRootViewController(animated: animated) {
        controllers.forEach { controller in
          runCompletion(for: controller)
        }
      }
    }
    
    private func runCompletion(for controller: UIViewController) {
      guard let completion = completions[controller] else { return }
      completion()
      completions.removeValue(forKey: controller)
    }
}
