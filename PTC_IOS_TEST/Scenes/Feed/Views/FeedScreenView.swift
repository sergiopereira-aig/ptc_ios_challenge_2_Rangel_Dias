//
//  FeedScreenView.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

class FeedScreenView: UIView {

    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.reusableIdentifier)
        tv.rowHeight = UITableView.automaticDimension
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .lightGray.withAlphaComponent(0.2)
        tv.separatorStyle = .none
        return tv
    }()
    
    var models: [FeedModel] = [
        FeedModel(id: "", header: FeedHeaderModel(tag: .recommendSeller, title: "Seller with a very long name that needs two lines to fit", sellerProfileLink: ""), images: ["https://i.picsum.photos/id/976/100/100.jpg?hmac=3kTljm04VvoZceHG7QPwWPA5cl4NAKZDwykVfbgy2Ak", "https://i.picsum.photos/id/381/100/100.jpg?hmac=IM1f82HpWgYjI-7sx3DpOj32VU-b4K2F9xjRtxMxv9w", "https://i.picsum.photos/id/983/100/100.jpg?hmac=1KxUX5habuF2b0xCYCz2uGHttY8BlaufijKwh1_2RA0"], deepLink: "", date: Date()),
        FeedModel(id: "", header: FeedHeaderModel(tag: .newArrivals, title: "Seller with a short name", sellerProfileLink: ""), images: ["https://i.picsum.photos/id/976/100/100.jpg?hmac=3kTljm04VvoZceHG7QPwWPA5cl4NAKZDwykVfbgy2Ak", "https://i.picsum.photos/id/381/100/100.jpg?hmac=IM1f82HpWgYjI-7sx3DpOj32VU-b4K2F9xjRtxMxv9w", "https://i.picsum.photos/id/983/100/100.jpg?hmac=1KxUX5habuF2b0xCYCz2uGHttY8BlaufijKwh1_2RA0"], deepLink: "", date: Date(), description: "Just in! New items from Jerseygramm and brandings avaiable. Check them out!")
    ]

}

extension FeedScreenView: ViewCoding {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
    }
    
}

extension FeedScreenView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.reusableIdentifier) as? FeedTableViewCell else { return UITableViewCell() }
        
        cell.config(models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
}


