//
//  ItemView.swift
//  Movve
//
//  Created by Fed on 24.08.2022.
//

import Foundation
import UIKit

final class ItemView: UIView {
    
    // MARK: - Local Constants
    
    private let imageHeight: CGFloat = 560
    private let fontDescriptionSize: CGFloat = 12
    private let fontNameSize: CGFloat = 44
    private let paddingInfoStackViewSize: CGFloat = 80
    private let topIndentInfoStackViewSize: CGFloat = 350
    
    // MARK: - UI Elements
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.backgroundColor = UIColor.black
        return view
    }()
    
    private lazy var containerView = UIView()
    
    lazy var image: UIImageView = {
        let image = UIImage(named: "Empty")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.prepareForAutoLayOut()
        imageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        return imageView
    }()
    
    private lazy var transparentView = UIView()
    
    private var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        return gradient
    }()
    
    lazy var itemName: UILabel = {
        let label = UILabel()
        label.text = "Властелин совец"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontNameSize, weight: .bold)
        label.textColor = ColorScheme.textColor
        
        return label
    }()
    
    lazy var itemTextInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "2020 | Action, Adventure | 2 h 35 m"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = ColorScheme.textDesriptionColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var starImage: UIButton = {
        let image = UIImage(systemName: "star.fill")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.tintColor = ColorScheme.rateColor
        button.prepareForAutoLayOut()
        button.heightAnchor.constraint(equalToConstant: 17).isActive = true
        return button
    }()
    
    lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorScheme.rateColor
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    lazy var rateProgressBar: UIProgressView = {
        let view = UIProgressView(progressViewStyle: .default)
        view.progressTintColor = ColorScheme.rateColor
        view.trackTintColor = ColorScheme.baseColor
        view.prepareForAutoLayOut()
        view.heightAnchor.constraint(equalToConstant: 4).isActive = true
        return view
    }()
    
    private lazy var rateProgressView: UIView = {
        let view = UIView()
        rateProgressBar.prepareForAutoLayOut()
        view.addSubview(rateProgressBar)
        rateProgressBar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        rateProgressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        rateProgressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        return view
    }()
    
    private lazy var starRateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [starImage, rateLabel])
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()
    
    private lazy var rateStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [starRateStackView, rateProgressView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var itemDesciption: UILabel = {
        let textView = UILabel()
        textView.numberOfLines = 0
        textView.font = UIFont.systemFont(ofSize: 16, weight: .light)
        textView.textColor = ColorScheme.textDesriptionColor
        textView.prepareForAutoLayOut()
        return textView
    }()
    
    lazy var actorCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        return collectionView
    }()
    
    private lazy var itemButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: ColorScheme.tapBarBackgroundColor)
        button.setTitle("Watch Now", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        button.layer.cornerRadius = 12.5
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.prepareForAutoLayOut()
        button.widthAnchor.constraint(equalToConstant: 210).isActive = true
        button.heightAnchor.constraint(equalToConstant: 55).isActive = true
        return button
    }()
    
    // MARK: - Initialaizer & Layout
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConstraits()
        self.layoutIfNeeded()
        applyGradient(with: gradientLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Action
    
    @objc private func buttonTapped(sender: UIButton) {
        print("button tapped")
    }
    
    // MARK: - Layout
    
    private func applyGradient(with gradientLayer: CAGradientLayer) {
        gradientLayer.frame = transparentView.bounds
        transparentView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setUpConstraits() {
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(image)
        containerView.addSubview(itemName)
        containerView.addSubview(itemTextInfoLabel)
        containerView.addSubview(rateStackView)
        containerView.addSubview(itemDesciption)
        containerView.addSubview(itemButton)
        image.addSubview(transparentView)
        
        scrollView.prepareForAutoLayOut()
        containerView.prepareForAutoLayOut()
        image.prepareForAutoLayOut()
        itemName.prepareForAutoLayOut()
        itemTextInfoLabel.prepareForAutoLayOut()
        rateStackView.prepareForAutoLayOut()
        itemDesciption.prepareForAutoLayOut()
        itemButton.prepareForAutoLayOut()
        transparentView.prepareForAutoLayOut()
                
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            image.topAnchor.constraint(equalTo: containerView.topAnchor),
            image.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            itemName.topAnchor.constraint(equalTo: image.bottomAnchor),
            itemName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 35),
            itemName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -35),
            
            itemTextInfoLabel.topAnchor.constraint(equalTo: itemName.bottomAnchor),
            itemTextInfoLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            itemTextInfoLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            rateStackView.topAnchor.constraint(equalTo: itemTextInfoLabel.bottomAnchor, constant: 12),
            rateStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 70),
            rateStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -70),
            
            itemDesciption.topAnchor.constraint(equalTo: rateStackView.bottomAnchor, constant: 12),
            itemDesciption.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            itemDesciption.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            
            itemButton.topAnchor.constraint(equalTo: itemDesciption.bottomAnchor, constant: 50),
            itemButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            itemButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            
            transparentView.bottomAnchor.constraint(equalTo: image.bottomAnchor),
            transparentView.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: image.trailingAnchor),
            transparentView.heightAnchor.constraint(equalTo: image.heightAnchor, multiplier: 0.2)
        ])
    }
}
