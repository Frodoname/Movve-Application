//
//  MainView.swift
//  Movve
//
//  Created by Fed on 16.08.2022.
//

import UIKit
import Foundation

final class MainView: UIView {
    
    private let customCellId = "customCellId"
    
    private let padding: CGFloat = 12
    private let heightLabel: CGFloat = 30
    private let horizntalSpace: CGFloat = 10
    private let collectionViewHeight: CGFloat = 200
    private let tapBarTopAnchorHeight: CGFloat = 700
    private let tapBarBottomAnchorHeight: CGFloat = -75
    private let tapBarPadding: CGFloat = 30
    private let buttonSize: CGFloat = 30
    private let buttonStackViewPadding: CGFloat = 30
    private let buttonStackViewTopBottomAnchos: CGFloat = 20
    
    private enum Image {
        static let homeButton = "homeButton"
        static let playButton = "playButton"
        static let favouriteButton = "bookmarkButton"
        static let accountButton = "accountButton"
    }
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        return view
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorScheme.backgroundColor)
        return view
    }()
    
    private lazy var popularMoviesLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Movies"
        label.textColor = ColorScheme.textColor
        label.textAlignment = .left
        return label
    }()
    
    lazy var popularMoviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.register(CustomCell.self, forCellWithReuseIdentifier: customCellId)
        return view
    }()
    
    private lazy var tvShowLabel: UILabel = {
        let label = UILabel()
        label.text = "TV Show"
        label.textColor = ColorScheme.textColor
        label.textAlignment = .left
        return label
    }()
    
    lazy var tvShowCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.register(CustomCell.self, forCellWithReuseIdentifier: customCellId)
        return view
    }()
    
    private lazy var continueWatchingLabel: UILabel = {
        let label = UILabel()
        label.text = "Continue watching"
        label.textColor = ColorScheme.textColor
        label.textAlignment = .left
        return label
    }()
    
    lazy var continueWatchingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.register(CustomCell.self, forCellWithReuseIdentifier: customCellId)
        return view
    }()
    
    private lazy var tapBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorScheme.tapBarBackgroundColor)
        view.layer.cornerRadius = 32
        return view
    }()

    private lazy var homeButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Image.homeButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        return button
    }()

    private lazy var playButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Image.playButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        return button
    }()

    private lazy var bookmarkButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Image.favouriteButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        return button
    }()

    private lazy var accountButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Image.accountButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        return button
    }()

    private lazy var buttonStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [homeButton, playButton, bookmarkButton, accountButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    //MARK: - Initialaizer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    func setUpLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(popularMoviesLabel)
        contentView.addSubview(popularMoviesCollectionView)
        contentView.addSubview(tvShowLabel)
        contentView.addSubview(tvShowCollectionView)
        contentView.addSubview(continueWatchingLabel)
        contentView.addSubview(continueWatchingCollectionView)
 
        
        scrollView.prepareForAutoLayOut()
        contentView.prepareForAutoLayOut()
        popularMoviesLabel.prepareForAutoLayOut()
        popularMoviesCollectionView.prepareForAutoLayOut()
        tvShowLabel.prepareForAutoLayOut()
        tvShowCollectionView.prepareForAutoLayOut()
        continueWatchingLabel.prepareForAutoLayOut()
        continueWatchingCollectionView.prepareForAutoLayOut()

        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            popularMoviesLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            popularMoviesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            popularMoviesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            popularMoviesCollectionView.topAnchor.constraint(equalTo: popularMoviesLabel.bottomAnchor),
            popularMoviesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            popularMoviesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            popularMoviesCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
            
            tvShowLabel.topAnchor.constraint(equalTo: popularMoviesCollectionView.bottomAnchor, constant: horizntalSpace),
            tvShowLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            tvShowLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            tvShowCollectionView.topAnchor.constraint(equalTo: tvShowLabel.bottomAnchor),
            tvShowCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            tvShowCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            tvShowCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),

            continueWatchingLabel.topAnchor.constraint(equalTo: tvShowCollectionView.bottomAnchor, constant: horizntalSpace),
            continueWatchingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            continueWatchingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            continueWatchingCollectionView.topAnchor.constraint(equalTo: continueWatchingLabel.bottomAnchor),
            continueWatchingCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            continueWatchingCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            continueWatchingCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
        ])
    }
}
