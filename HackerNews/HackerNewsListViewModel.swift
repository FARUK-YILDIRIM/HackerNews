//
//  HackerNewsListViewModel.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 9.03.2022.
//

import Foundation

protocol HackerNewsListViewModelDelegate: AnyObject {
    func fetchNewsDelegate()
}

class HackerNewsListViewModel {
    private var news = [Item]() {
        didSet {
            delegate?.fetchNewsDelegate()
        }
    }
    
    weak var delegate: HackerNewsListViewModelDelegate?
    
    let reuseID = "news"
    
    var count: Int {
        return news.count
    }
    
    func title(at index: Int) -> String {
        return news[index].title
    }
    
    
    func getNews(completion: @escaping ([Any]) -> Void){
        NetworkManager.share.getTopStories { news in
            guard let news = news else { return }
            DispatchQueue.main.async {
                completion(news)
            }
        }
    }
    
    func getItem(item: Int, completion: @escaping (Item) -> Void){
        NetworkManager.share.getItem(item: item) { item in
            guard let item = item else { return }
            DispatchQueue.main.async {
                self.news.append(item)
                completion(item)
            }
        }
        
    }
    
    
    func fetchNews() {
        self.getNews { news in
            let count = news.count
            for x in 0...count - 1 {
                self.getItem(item: news[x] as! Int) { _ in
                    //
                }
            }
        }
    }
    
    
}
