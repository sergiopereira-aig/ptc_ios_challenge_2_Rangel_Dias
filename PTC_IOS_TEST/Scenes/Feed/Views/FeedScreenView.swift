//
//  FeedScreenView.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

class FeedScreenView: UIView, FeedView {
    
    //MARK: -> Views
    lazy var segmentControll: PTCSegmentControll = {
        return PTCSegmentControll(buttonTitles: ["Following", "Explore"], height: 50)
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.reusableIdentifier)
        tv.rowHeight = UITableView.automaticDimension
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .lightGray.withAlphaComponent(0.2)
        tv.separatorStyle = .none
        tv.allowsSelection = false
        return tv
    }()
    
    /// In a real situation would be nicier to make the same for the "Following View"
    fileprivate lazy var exploreView: ExploreView = {
        let v = ExploreView()
        v.isHidden = true
        return v
    }()
    
    var viewModel: FeedViewModelProtocol?
    
    //MARK: -> Init
    init(viewModel: FeedViewModelProtocol?){
        self.viewModel = viewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var models: [FeedModel] = MockData.feedModels
    
    func didFetchData(_ models: [FeedModel]) {
        tableView.refreshControl?.endRefreshing()
        tableView.hideSkeleton()
        tableView.tableFooterView?.isHidden = true
        
        if models.isEmpty { return }
        
        if viewModel?.isFirtLoad == true {
            self.models = models
        } else {
            self.models.append(contentsOf: models)
        }
        
        tableView.reloadData()
    }
    
    @objc func reloadFeed() {
        viewModel?.fetchNewData()
    }
    
    private func createBottomLoader() {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))

        tableView.tableFooterView = spinner
        tableView.tableFooterView?.isHidden = false
    }
}

//MARK: -> View coding
extension FeedScreenView: ViewCoding {
    func buildViewHierarchy() {
        addSubview(segmentControll)
        addSubview(tableView)
        addSubview(exploreView)
    }
    
    func setupConstraints() {
        segmentControll
            .anchorVertical(top: safeAreaLayoutGuide.topAnchor)
            .fillSuperviewWidth()
            .anchorSize(heightConstant: 50)
        
        tableView
            .anchorVertical(top: segmentControll.bottomAnchor, bottom: bottomAnchor)
            .fillSuperviewWidth()
        
        exploreView
            .anchorVertical(top: segmentControll.bottomAnchor, bottom: bottomAnchor)
            .fillSuperviewWidth()
    }
    
    func setupAdditionalConfiguration() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector((reloadFeed)), for: .valueChanged)
        tableView.refreshControl = refresh
        
        segmentControll.delegate = self
        
        tableView.showSkeleton()
        viewModel?.fetchOldData()
    }
}

extension FeedScreenView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reusableIdentifier) as? FeedTableViewCell else { return UITableViewCell() }
        
        let callBack: FeedTapImageCallback = { [weak self] link in
            self?.viewModel?.routeToSeller(link)
        }
        
        cell.config(models[indexPath.row], didTapCellCallback: callBack)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = models.count-1
        
        guard let viewModel = viewModel else { return }
        
        if indexPath.row == lastRowIndex,
           !viewModel.isFirtLoad,
           viewModel.stillHasData,
           !viewModel.isFetching {
         
           createBottomLoader()
           viewModel.fetchOldData()
       }
   }
}

//MARK: -> PTCSegmentControllDelegate
extension FeedScreenView: PTCSegmentControllDelegate {
    
    func didSelect(_ index: Int) {
        let isToShowExploreView = index == 1
        exploreView.isHidden = !isToShowExploreView
    }
}

//MARK: -> Additional setup
extension UITableView: SkeletonDisplayable {}

fileprivate class ExploreView: UIView, ViewCoding {
    
    lazy var label: UILabel = {
       let l = UILabel()
        l.numberOfLines = .zero
        l.font = .boldSystemFont(ofSize: 18)
        l.textAlignment = .center
        l.text = "New features soon 🧑‍💻"
        return l
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubview(label)
    }
    
    func setupConstraints() {
        label.anchorCenterToSuperview()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .white
    }
}
