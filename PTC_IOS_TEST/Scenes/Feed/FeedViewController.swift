//
//  FeedViewController.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    let feedView = FeedScreenView()
    
    let segmentControll = PTCSegmentControll(buttonTitle: ["Following", "Explore"], height: 50)
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Feed"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
