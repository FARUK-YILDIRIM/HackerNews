//
//  TabBarViewController.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 10.03.2022.
//


import UIKit

final class TabBarViewController: UITabBarController {
    
    private let endpoint = EndPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let vc1 = UINavigationController(rootViewController: NewsViewController(title: "Top News", endpoint: endpoint.topStories))
        let vc2 = UINavigationController(rootViewController: NewsViewController(title: "Best News", endpoint: endpoint.bestStories))
        let vc3 = UINavigationController(rootViewController: NewsViewController(title: "News", endpoint: endpoint.newStories))
        
        
        vc1.tabBarItem.image = UIImage(systemName: "flame")
        vc1.title = "Top News"
        
        vc2.tabBarItem.image = UIImage(systemName: "star")
        vc2.title = "Best News"
        
        vc3.tabBarItem.image = UIImage(systemName: "newspaper")
        vc3.title = "News"
      
        tabBar.tintColor = .label
        setViewControllers([vc1, vc2, vc3], animated: true)

    }
}
