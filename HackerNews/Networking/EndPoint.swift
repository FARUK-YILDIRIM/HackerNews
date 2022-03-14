//
//  EndPoint.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 9.03.2022.
//

import Foundation

extension EndPoint {
    enum APIEndPoints: String {
        case baseUrlString = "https://hacker-news.firebaseio.com/v0/"
        case topStories = "topstories.json?print=pretty"
        case newStories = "newstories.json?print=pretty"
        case bestStories = "beststories.json?print=pretty"
    }
}

struct EndPoint {
    private let baseUrlString: String = {
        return APIEndPoints.baseUrlString.rawValue
    }()
    
    let topStories: String = {
        return "\(APIEndPoints.baseUrlString.rawValue)\(APIEndPoints.topStories.rawValue)"
    }()
    
    let newStories: String = {
        return "\(APIEndPoints.baseUrlString.rawValue)\(APIEndPoints.newStories.rawValue)"
    }()
    
    let bestStories: String = {
        return "\(APIEndPoints.baseUrlString.rawValue)\(APIEndPoints.bestStories.rawValue)"
    }()
    
    func getItem(_ item: Int) -> String {
        return "\(self.baseUrlString)item/\(item).json?print=pretty"
    }
}



