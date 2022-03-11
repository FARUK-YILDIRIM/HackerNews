//
//  NewsViewController.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 4.03.2022.
//

import UIKit

class NewsViewController: UIViewController {
  
    var vcTitle: String
    var vcEndpoint: String

    lazy var hackerNewsList: NewsListView = {
        let v = NewsListView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = self.vcTitle
        
        self.hackerNewsList.viewModel.fetchNews(endpoint: self.vcEndpoint)
        
        setupView()
    }
    
    init(title: String, endpoint: String) {
        self.vcTitle = title
        self.vcEndpoint = endpoint
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupView() {
        view.addSubview(hackerNewsList)
        setupContraints()
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            hackerNewsList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hackerNewsList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hackerNewsList.topAnchor.constraint(equalTo: view.topAnchor),
            hackerNewsList.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

