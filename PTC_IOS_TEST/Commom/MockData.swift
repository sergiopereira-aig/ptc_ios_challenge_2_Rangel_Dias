//
//  MockData.swift
//  PTC_IOS_TEST
//
//  Created by Rangel Cardoso Dias on 01/03/22.
//  Copyright © 2022 Jumia. All rights reserved.
//

import Foundation

struct MockData {
    
    static let feedModels: [FeedModel] = [
        FeedModel(id: "", header: FeedHeaderModel(tag: .none, title: "Seller with a very long name that needs two lines to fit", sellerProfileLink: ""), images: ["", "", ""], deepLink: "", date: "22/05/500"),
        FeedModel(id: "", header: FeedHeaderModel(tag: .none, title: "Seller with a short name", sellerProfileLink: ""), images: ["", "", ""], deepLink: "", date: "02/50/8488", description: "Just in! New items from Jerseygramm and brandings avaiable. Check them out!")
    ]
    
    static let feedJsonResponse = """
                {
                 "feedModels" : [
                    {
                  "id" : "1",
                  "header" : {
                    "tag" : "RECOMMENDED SELLER",
                    "title" : "Seller with a very long name that needs two lines to fit",
                    "sellerProfileLink" : "test"
                  },
                  "images" : [
                      "https://i.picsum.photos/id/976/100/100.jpg?hmac=3kTljm04VvoZceHG7QPwWPA5cl4NAKZDwykVfbgy2Ak",
                      "https://i.picsum.photos/id/381/100/100.jpg?hmac=IM1f82HpWgYjI-7sx3DpOj32VU-b4K2F9xjRtxMxv9w",
                       "https://i.picsum.photos/id/983/100/100.jpg?hmac=1KxUX5habuF2b0xCYCz2uGHttY8BlaufijKwh1_2RA0"
                    ],
                   "deepLink" : "test",
                   "date" : "02/05/2022"
                  },
                
                    {
                  "id" : "2",
                  "header" : {
                    "tag" : "RECOMMENDED SELLER",
                    "title" : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium",
                    "sellerProfileLink" : "test"
                  },
                  "images" : [
                      "https://i.picsum.photos/id/172/100/100.jpg?hmac=cxX4RjC9_cvr2T_6Kqu13NqZODqlIBSz-pMU35O5Uqw",
                      "https://i.picsum.photos/id/935/100/100.jpg?hmac=bAIDye2mjE3efAINsxRsdIeRpCdQG1ub-xXEU4tFdq4",
                       "https://i.picsum.photos/id/730/100/100.jpg?hmac=z64FyVCpzIJ3ANxLYXN0uyARvRtUxmlWFSBFjQjaCwk"
                    ],
                   "deepLink" : "test",
                   "date" : "02/05/2022",
                   "description" : "Suspendisse non posuere turpis. Duis dignissim ullamcorper enim, vel commodo leo varius at."
                  },
                  
                  {
                  "id" : "3",
                  "header" : {
                    "tag" : "NEW ARRIVALS",
                    "title" :  "Seller with a short name",
                    "sellerProfileLink" : "test"
                  },
                  "images" : [
                      "https://i.picsum.photos/id/933/100/100.jpg?hmac=Gn6csbCA8Dn2IIHZVxuLXvzXkwi3ElLhU2RbmeRHFTQ",
                      "https://i.picsum.photos/id/557/100/100.jpg?hmac=sOn8TLgaoqlIzxH6r8R3kP6TwT-2k3Euj3-hkEzAQjQ",
                       "https://i.picsum.photos/id/442/100/100.jpg?hmac=p_XdIV_nEOwA9ThvTmqTdgDesvKVHKP_8FbdKyAwZYs"
                    ],
                   "deepLink" : "test",
                   "date" : "02/02/2022",
                   "description" : "Just in! New items from Jerseygramm and brandings avaiable. Check them out!"
                  }
                    ]
                }
                """
    
    static let feedJsonResponse2 = """
                {
                 "feedModels" : [
                    {
                  "id" : "4",
                  "header" : {
                    "tag" : "RECOMMENDED SELLER",
                    "title" : "Nam quis nisl sed lacus condimentum",
                    "sellerProfileLink" : "test"
                  },
                  "images" : [
                      "https://i.picsum.photos/id/780/100/100.jpg?hmac=Ag-EwFZMapTLk-58YgCFUhTzbxF-6E81aPk42W7Yizs",
                      "https://i.picsum.photos/id/967/100/100.jpg?hmac=GKSKI5YRaotZFOBvXjsa0qCXX-RcM6XEOH54lNpImFI",
                       "https://i.picsum.photos/id/98/100/100.jpg?hmac=KSUnGGqZYEYEJdqkwdAMELVGOGGYC3Xw5faaDXDY2u4"
                    ],
                   "deepLink" : "test",
                   "date" : "02/03/2022"
                  },
                  
                  {
                  "id" : "4",
                  "header" : {
                    "tag" : "NEW ARRIVALS",
                    "title" :  "Cras tincidunt nisi a malesuada ornare. ",
                    "sellerProfileLink" : "test"
                  },
                  "images" : [
                      "https://i.picsum.photos/id/985/100/100.jpg?hmac=XdeEF2QiMjOi7TdHvr96bH3GmJE3ilmPnZmkHPdaE0A",
                      "https://i.picsum.photos/id/1073/100/100.jpg?hmac=jxPYy-2gpoXLbe3CSDdJqxOy13v9IvH0VxCiaULaOrM",
                       "https://i.picsum.photos/id/391/100/100.jpg?hmac=jMgopFfWvz7j-XiaoHwklf4Gqbt6Bs-B4IOqIMjMiBE"
                    ],
                   "deepLink" : "test",
                   "date" : "02/02/2022",
                   "description" : "Sed fringilla nunc diam, at fringilla lorem tincidunt ac. Nam ut nunc sem. In rutrum accumsan nunc, ac venenatis nunc lacinia sed. Proin posuere mauris ac vulputate imperdiet. Praesent condimentum diam id mauris dictum tincidunt sed in quam."
                  }
                    ]
                }
                """
}
