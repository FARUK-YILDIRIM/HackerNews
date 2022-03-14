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
    
    func urlLabel(at index: Int) -> String {
        let url = news[index].url.host
        return String(describing: url!) 
    }
    
    func urlFull(at index: Int) -> String {
        return "\(news[index].url)"
    }
    
    func scoreLabel(at index: Int) -> String {
        return "\(news[index].score) points"
    }
    
    func authorLabel(at index: Int) -> String {
        return news[index].by
    }
    
    func typeLabel(at index: Int) -> String {
        return "\(news[index].kids.count) comments"
    }
    
    func timeLabel(at index: Int) -> String {
        let time = "\(news[index].time)"
        return setTimestamp(epochTime: time)
    }
    
    func getComments(at index: Int) -> [Int] {
        return news[index].kids
    }
    
    func getNews(endpoint: String, completion: @escaping ([Any]) -> Void){
        NetworkManager.share.getNews(endpoint: endpoint) { news in
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
    
    
    func fetchNews(endpoint: String, get: Int = 50) {
        self.getNews(endpoint: endpoint) { news in
            let count = news.count
            guard get < count else { return }
            print(count)
            for x in 0...get {
                self.getItem(item: news[x] as! Int) { _ in
                    //
                }
            }
        }
    }
    
    
}

extension HackerNewsListViewModel {
    func setTimestamp(epochTime: String) -> String {
        let currentDate = Date()
        let epochDate = Date(timeIntervalSince1970: TimeInterval(epochTime)!)

        let calendar = Calendar.current

        let currentDay = calendar.component(.day, from: currentDate)
        let currentHour = calendar.component(.hour, from: currentDate)
        let currentMinutes = calendar.component(.minute, from: currentDate)
        let currentSeconds = calendar.component(.second, from: currentDate)

        let epochDay = calendar.component(.day, from: epochDate)
        let epochMonth = calendar.component(.month, from: epochDate)
        let epochYear = calendar.component(.year, from: epochDate)
        let epochHour = calendar.component(.hour, from: epochDate)
        let epochMinutes = calendar.component(.minute, from: epochDate)
        let epochSeconds = calendar.component(.second, from: epochDate)

        if (currentDay - epochDay < 30) {
            if (currentDay == epochDay) {
                if (currentHour - epochHour == 0) {
                    if (currentMinutes - epochMinutes == 0) {
                        if (currentSeconds - epochSeconds <= 1) {
                            return String(currentSeconds - epochSeconds) + " second ago"
                        } else {
                            return String(currentSeconds - epochSeconds) + " seconds ago"
                        }

                    } else if (currentMinutes - epochMinutes <= 1) {
                        return String(currentMinutes - epochMinutes) + " minute ago"
                    } else {
                        return String(currentMinutes - epochMinutes) + " minutes ago"
                    }
                } else if (currentHour - epochHour <= 1) {
                    return String(currentHour - epochHour) + " hour ago"
                } else {
                    return String(currentHour - epochHour) + " hours ago"
                }
            } else if (currentDay - epochDay <= 1) {
                return String(currentDay - epochDay) + " day ago"
            } else {
                return String(currentDay - epochDay) + " days ago"
            }
        } else {
            return String(epochDay) + " " + getMonthNameFromInt(month: epochMonth) + " " + String(epochYear)
        }
    }


    func getMonthNameFromInt(month: Int) -> String {
        switch month {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "May"
        case 6:
            return "Jun"
        case 7:
            return "Jul"
        case 8:
            return "Aug"
        case 9:
            return "Sept"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        case 12:
            return "Dec"
        default:
            return ""
        }
    }
}
