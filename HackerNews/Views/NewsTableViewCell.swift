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
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
     
    func makeLabel(size: CGFloat? = 15, color: UIColor? = .systemGray, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = color!
        label.font = UIFont.systemFont(ofSize: size!)
        label.numberOfLines = numberOfLines
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    lazy var titleLabel = makeLabel(size: 20, color: .label, numberOfLines: 0)
    lazy var urlLabel = makeLabel(size: 12, color: .link)
    lazy var scoreLabel = makeLabel()
    lazy var authorLabel = makeLabel()
    lazy var timeLabel = makeLabel()
    lazy var commentLabel = makeLabel()

    
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
        stackView.addArrangedSubview(commentLabel)

        setupConstraints()
    }
    
    func setupConstraints() {
        // title
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint (equalTo: trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
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
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
        
    }
    

}
