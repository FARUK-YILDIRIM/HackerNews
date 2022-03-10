//
//  NewsTableViewCell.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 9.03.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 0
        v.textAlignment = .left
        v.textColor = .black
        v.font = UIFont.systemFont(ofSize: 20)
        v.adjustsFontSizeToFitWidth = true
        return v
    }()
    
    lazy var urlLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 1
        v.textAlignment = .left
        v.textColor = .systemBlue
        v.font = UIFont.systemFont(ofSize: 11)
        v.adjustsFontSizeToFitWidth = true
        return v
    }()
    
    lazy var scoreLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 1
        v.textAlignment = .left
        v.textColor = .systemGray
        v.font = UIFont.systemFont(ofSize: 15)
        v.adjustsFontSizeToFitWidth = true
        return v
    }()
    
    lazy var authorLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 1
        v.textAlignment = .left
        v.textColor = .gray
        v.font = UIFont.systemFont(ofSize: 15)
        v.adjustsFontSizeToFitWidth = true
        return v
    }()
    
    lazy var timeLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 1
        v.textAlignment = .left
        v.textColor = .gray
        v.font = UIFont.systemFont(ofSize: 15)
        v.adjustsFontSizeToFitWidth = true
        return v
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
        addSubview(urlLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(authorLabel)
 
        setupConstraints()
    }
    
    func setupConstraints() {
        // title
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint (equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            //titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        // url
        NSLayoutConstraint.activate([
            urlLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            urlLabel.trailingAnchor.constraint (equalTo: trailingAnchor),
            urlLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
        ])
        
        // stack view
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            stackView.trailingAnchor.constraint (equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
        
    }
    

}
