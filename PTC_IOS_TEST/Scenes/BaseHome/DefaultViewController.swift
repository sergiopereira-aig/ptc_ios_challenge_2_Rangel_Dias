//
//  DefaultViewController.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit


final class DefaultViewController: UIViewController {
    
    lazy var label: UILabel = {
       let l = UILabel()
        l.numberOfLines = .zero
        l.font = .boldSystemFont(ofSize: 16)
        l.textAlignment = .center
        l.text = "New features soon 🧑‍💻"
        return l
    }()
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Under developement"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        
        label.anchorCenterToSuperview()
    }
}
