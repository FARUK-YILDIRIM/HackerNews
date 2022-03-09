//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 9.03.2022.
//

import Foundation

import Foundation

class NetworkManager {

    static let share = NetworkManager()
    private let endpoint = EndPoint()
    private init() {}
    
    
    func getTopStories (completion: @escaping ([Int]?) -> Void) {
        let urlString = endpoint.topStories
        guard let url = URL (string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }

            let news = try? JSONDecoder().decode ([Int].self, from: data)
            news == nil ? completion(nil): completion (news.self)
            
        }.resume()
        
    }
    
    func getItem (item: Int, completion: @escaping (Item?) -> Void) {
        let urlString = endpoint.getItem(item)
        guard let url = URL (string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                return
            }

            let item = try? JSONDecoder().decode (Item.self, from: data)
            item == nil ? completion(nil): completion (item.self)

        }.resume()
        
    }
    
}
