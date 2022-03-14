//
//  CommentsTableViewCell.swift
//  HackerNews
//
//  Created by Faruk YILDIRIM on 14.03.2022.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {

    func makeLabel(size: CGFloat? = 15, color: UIColor? = .systemGray, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = textAlignment
        label.textColor = color!
        label.font = UIFont.systemFont(ofSize: size!)
        label.numberOfLines = numberOfLines
        label.adjustsFontSizeToFitWidth = true
        label.setContentHuggingPriority(UILayoutPriority(rawValue: 240), for: .horizontal)
        return label
    }
    
    lazy var commentLabel = makeLabel(size: 15, color: .label, numberOfLines: 0)
    lazy var authorLabel = makeLabel(size: 15, color: .label, numberOfLines: 1, textAlignment: .center)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(authorLabel)
        addSubview(commentLabel)

        setupConstraints()
    }
    
    func setupConstraints() {
        
        // author
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            authorLabel.trailingAnchor.constraint (equalTo: trailingAnchor),
            authorLabel.topAnchor.constraint(equalTo: topAnchor),
            authorLabel.bottomAnchor.constraint(equalTo: commentLabel.topAnchor, constant: 8)
        ])
        
        // comment
        NSLayoutConstraint.activate([
            commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            commentLabel.trailingAnchor.constraint (equalTo: trailingAnchor, constant: -8),
            commentLabel.topAnchor.constraint(equalTo: authorLabel.topAnchor, constant: 10),
            commentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
        ])
        
    }
    

}
