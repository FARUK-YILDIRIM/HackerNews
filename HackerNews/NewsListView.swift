//
//  NewsListView.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 9.03.2022.
//

import UIKit

protocol TabDelegate {
    func didButtonTapped(url: String)
}

class NewsListView: UIView {

    var delegate: TabDelegate?
    
    lazy var viewModel: HackerNewsListViewModel = {
        let viewModel = HackerNewsListViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    lazy var tableView: UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tableFooterView = UIView()
        v.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        v.delegate = self
        v.dataSource = self
        return v
    }()
    
    init() {
        super.init(frame: .zero)
        //self.viewModel.fetchNews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // tableview
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}


extension NewsListView: HackerNewsListViewModelDelegate {
    func fetchNewsDelegate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}


extension NewsListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        cell?.titleLabel.text = viewModel.title(at: indexPath.row)
        cell?.urlLabel.text = viewModel.urlLabel(at: indexPath.row)
        cell?.scoreLabel.text = "\(String(viewModel.scoreLabel(at: indexPath.row))) points"
        cell?.authorLabel.text = "by \(viewModel.authorLabel(at: indexPath.row))"
        cell?.timeLabel.text = "\(viewModel.timeLabel(at: indexPath.row))"

        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news  = viewModel.urlFull(at: indexPath.row)
        guard URL(string: news) != nil else {
            return
        }
        
        delegate?.didButtonTapped(url: news)
    }
   
}
