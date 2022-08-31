//
//  PopularMovieCell.swift
//  Movve
//
//  Created by Fed on 17.08.2022.
//

import Foundation
import UIKit
import Kingfisher

final class CustomCell: UICollectionViewCell {
    
    func configureMovieCell(with item: ItemModel) {
        nameLabel.text = item.name
        dateLabel.text = item.date
        guard let urlImage = URL(string: item.image) else {
            return
        }
        image.kf.setImage(with: urlImage)
    }
    
    func configureEmptyCell() {
        nameLabel.text = "Add you favoutiute movies and TV's here"
        dateLabel.text = ""
    }

    private let imageHeightMultuplier: CGFloat = 0.8

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        return image
    }()
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "11 December 2022"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 8)
        label.textColor = ColorScheme.textColor
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Новый фильм"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = ColorScheme.textColor
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: ColorScheme.backgroundColor)
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

            dateLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 2),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            nameLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 1),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
