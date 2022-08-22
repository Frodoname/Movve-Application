//
//  PopularMovieCell.swift
//  Movve
//
//  Created by Fed on 17.08.2022.
//

import Foundation
import UIKit

final class CustomCell: UICollectionViewCell {
    
    private let imageHeightMultuplier: CGFloat = 0.8
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        return image
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "11 December 2022"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 8)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый фильм"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout() {
        addSubview(image)
        addSubview(dateLabel)
        addSubview(nameLabel)
        
        image.prepareForAutoLayOut()
        dateLabel.prepareForAutoLayOut()
        nameLabel.prepareForAutoLayOut()
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.heightAnchor.constraint(equalTo: heightAnchor, multiplier: imageHeightMultuplier),
            
            dateLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 3),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
