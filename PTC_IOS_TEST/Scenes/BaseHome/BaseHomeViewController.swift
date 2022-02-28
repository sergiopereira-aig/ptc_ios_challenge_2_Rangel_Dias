//
//  BaseHomeViewController.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

class BaseHomeViewController: UITabBarController, UITabBarControllerDelegate {
    
    private let controllers: [UIViewController]
    private let icons: [String]
    
    init(_ controllers: [UIViewController], _ systemIcons: [String]) {
        self.controllers = controllers
        self.icons = systemIcons
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        tabBar.tintColor = .orange
        selectedIndex = 2
    }
    
    func setupView() {
        var vcs: [UIViewController] = []
        for(i,vc) in controllers.enumerated() {
            let img = UIImage(systemName: icons[i])
            
            let tabBarItems = (title: "", image: img, selectedImage: img)

            let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
            
            vc.tabBarItem = tabBarItem
            
            vcs.append(vc)
        }
        viewControllers = vcs
    }
    
}
