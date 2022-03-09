//
//  ViewController.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 4.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var hackerNewsList: NewsListView = {
        let v = NewsListView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
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

