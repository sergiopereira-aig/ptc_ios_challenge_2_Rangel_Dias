//
//  FeedViewController.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    let feedView: FeedView
    
    //MARK: -> Init
    init(feedView: FeedView) {
        self.feedView = feedView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -> View life cycle
    override func loadView() {
        view = feedView
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.tabBarController?.navigationItem.title = "Feed"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedView.setupView()
    }
}
