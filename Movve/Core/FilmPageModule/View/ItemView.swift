//
//  ItemView.swift
//  Movve
//
//  Created by Fed on 24.08.2022.
//

import Foundation
import UIKit

final class ItemView: UIView {
    
    private let imageHeight: CGFloat = 560
    private let fontDescriptionSize: CGFloat = 12
    private let fontNameSize: CGFloat = 23
    private let paddingInfoStackViewSize: CGFloat = 80
    private let topIndentInfoStackViewSize: CGFloat = 350
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.backgroundColor = UIColor(named: ColorScheme.backgroundColor)
        return view
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [contentView])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImage(named: "Empty")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var itemInformationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemName, itemTextInfoStackView, itemRateStackView])
        stackView.axis = .vertical
//        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var itemName: UILabel = {
        let label = UILabel()
        label.text = "Властелин совец"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontNameSize, weight: .bold)
        label.textColor = ColorScheme.textColor
        return label
    }()
    
    private lazy var itemTextInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [itemYear, commaSeparator, itemGenre, commaSeparator2, itemDuration])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var itemYear: UILabel = {
        let label = UILabel()
        label.text = "2022"
        label.font = UIFont.systemFont(ofSize: fontDescriptionSize, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        return label
    }()
    
    private lazy var commaSeparator: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.font = UIFont.systemFont(ofSize: fontDescriptionSize, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        return label
    }()
    private lazy var commaSeparator2: UILabel = {
        let label = UILabel()
        label.text = "|"
        label.font = UIFont.systemFont(ofSize: fontDescriptionSize, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        return label
    }()
    
    private lazy var itemGenre: UILabel = {
        let label = UILabel()
        label.text = "Adventure, Action"
        label.font = UIFont.systemFont(ofSize: fontDescriptionSize, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        return label
    }()
    
    private lazy var itemDuration: UILabel = {
        let label = UILabel()
        label.text = "2 h 30 min"
        label.font = UIFont.systemFont(ofSize: fontDescriptionSize, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        return label
    }()
    
    private lazy var itemRateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textRateLabel, rate])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var textRateLabel: UILabel = {
        let label = UILabel()
        label.text = "Rate of the movie: "
        label.font = UIFont.systemFont(ofSize: fontDescriptionSize, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        return label
    }()
    
    private lazy var rate: UILabel = {
        let label = UILabel()
        label.text = "7.7"
        label.font = UIFont.systemFont(ofSize: fontDescriptionSize, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        return label
    }()
    
    private lazy var textDescriptior: UILabel = {
        let textView = UILabel()
        textView.numberOfLines = 0
        textView.text = "Description of the Movie. Movie is the movie, cat is the cat, meow is the meow! Arrrr. Good job"
        textView.font = UIFont.systemFont(ofSize: 44, weight: .light)
        textView.textColor = .white
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraits()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraits() {
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(image)
        contentView.addSubview(itemInformationStackView)
        contentView.addSubview(textDescriptior)
        
        scrollView.prepareForAutoLayOut()
        contentView.prepareForAutoLayOut()
        image.prepareForAutoLayOut()
        itemInformationStackView.prepareForAutoLayOut()
        textDescriptior.prepareForAutoLayOut()
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            image.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.heightAnchor.constraint(equalToConstant: imageHeight),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            itemInformationStackView.topAnchor.constraint(equalTo: image.bottomAnchor),
            itemInformationStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: paddingInfoStackViewSize),
            itemInformationStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -paddingInfoStackViewSize),
            
            textDescriptior.topAnchor.constraint(equalTo: itemInformationStackView.bottomAnchor, constant: 10),
            textDescriptior.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textDescriptior.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textDescriptior.heightAnchor.constraint(equalToConstant: 400)
            
        ])
    }
}
