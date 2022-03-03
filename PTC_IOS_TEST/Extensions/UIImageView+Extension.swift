//
//  UIImageView+Extension.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

/// function to make easier to download images
extension UIImageView {

    func loadImage(from url:String){
    
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let indicator = createLoadingIndicator()
        
        let datatask = session.dataTask(with: request) { (data, response, error) -> Void in
            guard error == nil, let data = data else {
                print(error?.localizedDescription as Any)
                ///Should handle erro with a default image, for example
                return
            }
            
            DispatchQueue.main.async {
                indicator.removeFromSuperview()
                self.image = UIImage(data: data)
            }
        }
        datatask.resume()
    }

    private func createLoadingIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .medium)
    
        DispatchQueue.main.async {
            self.addSubview(indicator)
            
            indicator.anchorCenterToSuperview()
            
            indicator.startAnimating()
        }
    
        return indicator
    }
}
