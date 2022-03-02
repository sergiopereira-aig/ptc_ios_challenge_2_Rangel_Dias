//
//  BaseHomeViewController.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

class BaseHomeViewController: UITabBarController, UITabBarControllerDelegate {
    
    //MARK:  -> Propertis
    private let controllers: [UIViewController]
    private let icons: [String]
    private let titles: [String]
    
    //MARK:  -> Init
    init(_ controllers: [UIViewController], _ systemIcons: [String], _ titles: [String]) {
        self.controllers = controllers
        self.icons = systemIcons
        self.titles = titles
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:  -> View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        setupView()
        view.backgroundColor = .white
        tabBar.backgroundColor = .white
        tabBar.tintColor = .orange
        tabBar.unselectedItemTintColor = UIColor(red: 40/255.0, green: 40/255.0, blue: 40/255.0, alpha: 1.0)
        selectedIndex = 2
    }
    
    func setupView() {
        var vcs: [UIViewController] = []
        for(i,vc) in controllers.enumerated() {
            let img = UIImage(systemName: icons[i])
            let tabBarItems = (title: titles[i], image: img, selectedImage: img)

            let tabBarItem = UITabBarItem(title: tabBarItems.title, image: tabBarItems.image, selectedImage: tabBarItems.selectedImage)
            vc.tabBarItem = tabBarItem
            
            vcs.append(vc)
        }
        viewControllers = vcs
    }
    
    private func configNavBar() {
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        searchButton.tintColor = .white
        
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: nil)
        cartButton.tintColor = .white
        
        navigationItem.rightBarButtonItems = [searchButton, cartButton]
    }
}
