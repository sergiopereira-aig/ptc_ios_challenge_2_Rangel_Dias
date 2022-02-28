//
//  ViewController.swift
//  PTC_IOS_TEST
//
//  Created by Tiago Valente on 27/06/2019.
//  Copyright © 2019 Jumia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let feedView = FeedScreenView()
    
    let segmentControll = PTCSegmentControll(buttonTitle: ["Following", "Explore"], height: 50)
    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.navigationBar.isHidden = false
        view.addSubview(segmentControll)
        view.addSubview(feedView)
        
        segmentControll
            .anchorVertical(top: view.safeAreaLayoutGuide.topAnchor)
            .fillSuperviewWidth()
            .anchorSize(heightConstant: 50)
        
        feedView
            .anchorVertical(top: segmentControll.bottomAnchor, bottom: view.bottomAnchor)
            .fillSuperviewWidth()
        
        feedView.setupView()
        
        
    }


}

