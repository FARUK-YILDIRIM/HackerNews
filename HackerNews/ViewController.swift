//
//  ViewController.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 4.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        NetworkManager.share.getTopStories { newsData in
            
            for x in 0...10 {
                NetworkManager.share.getItem(item: newsData?[x] ?? 0) { itemData in
                    print(itemData?.title ?? "-- No Title --", itemData?.id ?? "-- NO ID --")
                }
            }
            
        }
    }
    
    
}

