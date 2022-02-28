//
//  UIImageView+Extension.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 28/02/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import UIKit

extension UIImageView {

    //load image async from inaternet
    func loadFromURL(imgUrl:String){
        //NSURL
        guard let url = URL(string: imgUrl) else { return }
        //Request
        let request = URLRequest(url: url)
        //Session
        let session = URLSession.shared
        //Data task
        let datatask = session.dataTask(with: request) { (data, response, error) -> Void in
            if error != nil {
                print(error?.localizedDescription as Any)
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        
        datatask.resume()
    }


}
