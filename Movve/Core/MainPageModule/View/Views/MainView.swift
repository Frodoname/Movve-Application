//
//  MainView.swift
//  Movve
//
//  Created by Fed on 16.08.2022.
//

import UIKit
import Foundation

protocol MainViewProtocol: AnyObject {
    func didRefreshData()
}

final class MainView: UIView {
    
    weak var delegate: MainViewProtocol?

    private let customCellId = "customCellId"
    private let lastCellId = "lastCellId"

    private let padding: CGFloat = 12
    private let heightLabel: CGFloat = 30
    private let collectionViewHeight: CGFloat = 200
    private let horizontalSpace: CGFloat = 10
    private let tapBarBottomPadding: CGFloat = -20
    private let tapBarPadding: CGFloat = 50
    private let buttonSize: CGFloat = 30
    private let tapBarSpace: CGFloat = 100

    private enum Image {
        static let homeButton = "homeButton"
        static let playButton = "playButton"
        static let favouriteButton = "bookmarkButton"
        static let accountButton = "accountButton"
    }

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.refreshControl = refreshControll
        return view
    }()
    
    private lazy var refreshControll: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        let atributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh", attributes: atributes)
        refreshControl.addTarget(self, action: #selector(refreshScrollView), for: .valueChanged)
        refreshControl.tintColor = .white
        return refreshControl
    }()

    private lazy var contentView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [upperView, middleView, downView, downTapBarView])
        view.backgroundColor = UIColor(named: ColorScheme.backgroundColor)
        view.axis = .vertical
        return view
    }()
    
    private lazy var upperView: UIView = {
        let view = UIView()
        view.prepareForAutoLayOut()
        view.heightAnchor.constraint(equalToConstant: collectionViewHeight + heightLabel).isActive = true
        return view
    }()

    private lazy var popularMoviesLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular Movies"
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = ColorScheme.textColor
        label.textAlignment = .left
        return label
    }()

    lazy var popularMoviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor(named: ColorScheme.backgroundColor)
        view.showsHorizontalScrollIndicator = false
        view.register(CustomCell.self, forCellWithReuseIdentifier: customCellId)
        view.register(LastCell.self, forCellWithReuseIdentifier: lastCellId)
        return view
    }()
    
    private lazy var middleView: UIView = {
        let view = UIView()
        view.prepareForAutoLayOut()
        view.heightAnchor.constraint(equalToConstant: collectionViewHeight + heightLabel).isActive = true
        return view
    }()

    private lazy var tvShowLabel: UILabel = {
        let label = UILabel()
        label.text = "TV Show"
        label.textColor = ColorScheme.textColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    lazy var tvShowCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor(named: ColorScheme.backgroundColor)
        view.showsHorizontalScrollIndicator = false
        view.register(CustomCell.self, forCellWithReuseIdentifier: customCellId)
        view.register(LastCell.self, forCellWithReuseIdentifier: lastCellId)
        return view
    }()
    
    private lazy var downView: UIView = {
        let view = UIView()
        view.prepareForAutoLayOut()
        view.heightAnchor.constraint(equalToConstant: collectionViewHeight + heightLabel).isActive = true
        return view
    }()

    lazy var continueWatchingLabel: UILabel = {
        let label = UILabel()
        label.text = "Continue watching"
        label.textColor = ColorScheme.textColor
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    lazy var continueWatchingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor(named: ColorScheme.backgroundColor)
        view.showsHorizontalScrollIndicator = false
        view.register(CustomCell.self, forCellWithReuseIdentifier: customCellId)
        view.register(LastCell.self, forCellWithReuseIdentifier: lastCellId)
        return view
    }()
    
    private lazy var downTapBarView: UIView = {
        let view = UIView()
        view.prepareForAutoLayOut()
        view.heightAnchor.constraint(equalToConstant: tapBarSpace).isActive = true
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
        button.prepareForAutoLayOut()
        button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        return button
    }()

    private lazy var playButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Image.playButton), for: .normal)
        button.prepareForAutoLayOut()
        button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        return button
    }()

    private lazy var bookmarkButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Image.favouriteButton), for: .normal)
        button.prepareForAutoLayOut()
        button.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        button.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
        return button
    }()

    private lazy var accountButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: Image.accountButton), for: .normal)
        button.prepareForAutoLayOut()
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

    // MARK: - Initialaizer

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action Functions
    
    @objc private func refreshScrollView(sender: UIRefreshControl) {
        delegate?.didRefreshData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sender.endRefreshing()
        }
    }

    // MARK: - Layout

    func setUpLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        upperView.addSubview(popularMoviesLabel)
        upperView.addSubview(popularMoviesCollectionView)
        middleView.addSubview(tvShowLabel)
        middleView.addSubview(tvShowCollectionView)
        downView.addSubview(continueWatchingLabel)
        downView.addSubview(continueWatchingCollectionView)
        addSubview(tapBar)
        tapBar.addSubview(buttonStackView)

        scrollView.prepareForAutoLayOut()
        contentView.prepareForAutoLayOut()
        popularMoviesLabel.prepareForAutoLayOut()
        popularMoviesCollectionView.prepareForAutoLayOut()
        tvShowLabel.prepareForAutoLayOut()
        tvShowCollectionView.prepareForAutoLayOut()
        continueWatchingLabel.prepareForAutoLayOut()
        continueWatchingCollectionView.prepareForAutoLayOut()
        tapBar.prepareForAutoLayOut()
        buttonStackView.prepareForAutoLayOut()

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
            
            popularMoviesLabel.topAnchor.constraint(equalTo: upperView.topAnchor),
            popularMoviesLabel.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: padding),
            popularMoviesCollectionView.topAnchor.constraint(equalTo: popularMoviesLabel.bottomAnchor, constant: horizontalSpace),
            popularMoviesCollectionView.leadingAnchor.constraint(equalTo: upperView.leadingAnchor, constant: padding),
            popularMoviesCollectionView.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -padding),
            popularMoviesCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
            
            tvShowLabel.topAnchor.constraint(equalTo: middleView.topAnchor, constant: horizontalSpace),
            tvShowLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: padding),
            tvShowCollectionView.topAnchor.constraint(equalTo: tvShowLabel.bottomAnchor, constant: horizontalSpace),
            tvShowCollectionView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: padding),
            tvShowCollectionView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -padding),
            tvShowCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
            
            continueWatchingLabel.topAnchor.constraint(equalTo: downView.topAnchor, constant: 2 * horizontalSpace),
            continueWatchingLabel.leadingAnchor.constraint(equalTo: downView.leadingAnchor, constant: padding),
            continueWatchingCollectionView.topAnchor.constraint(equalTo: continueWatchingLabel.bottomAnchor, constant: horizontalSpace),
            continueWatchingCollectionView.leadingAnchor.constraint(equalTo: downView.leadingAnchor, constant: padding),
            continueWatchingCollectionView.trailingAnchor.constraint(equalTo: downView.trailingAnchor, constant: -padding),
            continueWatchingCollectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight),
            
            tapBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: tapBarPadding),
            tapBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -tapBarPadding),
            tapBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: tapBarBottomPadding),
            tapBar.heightAnchor.constraint(equalToConstant: 64),
            buttonStackView.centerYAnchor.constraint(equalTo: tapBar.centerYAnchor),
            buttonStackView.leadingAnchor.constraint(equalTo: tapBar.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: tapBar.trailingAnchor, constant: -20)
        ])
    }
}
