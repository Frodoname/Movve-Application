//
//  ViewController.swift
//  Movve
//
//  Created by Fed on 08.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let cellWidth: CGFloat = 140
    private let cellHeight: CGFloat = 200
    
    private var networkService = NetworkService()
    private let dtoTransformer = DtoTransformer()
    
    private lazy var movieArray: [ItemModel] = []
    private lazy var tvArray: [ItemModel] = []
    private lazy var continueWatchingArray: [ItemModel] = []
    
    private var mainView: MainView!
    
    private let customCellId = "customCellId"
    private let lastCellId = "lastCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpMainView()
        fetchData()
        mainView.delegate = self
    }
    // MARK: - UI Setup
    
    private func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                            UIColor.white]
        title = "Movve"
    }
    
    private func setUpMainView() {
        view.backgroundColor = ColorScheme.backgroundColor
        mainView = MainView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(mainView)
        
        mainView.popularMoviesCollectionView.delegate = self
        mainView.popularMoviesCollectionView.dataSource = self
        mainView.tvShowCollectionView.delegate = self
        mainView.tvShowCollectionView.dataSource = self
        mainView.continueWatchingCollectionView.delegate = self
        mainView.continueWatchingCollectionView.dataSource = self
    }
    
    // MARK: - Networking
    
    private func fetchData() {
        networkService.fetchPopularMovies(with: networkService.urlMovie) { [weak self] result in
            switch result {
            case .success(let model):
                self?.movieArray = self?.dtoTransformer.networkMovieToDomainArray(with: model.results) ?? []
                self?.movieArray.shuffle()
                self?.mainView.popularMoviesCollectionView.reloadData()
                self?.mainView.popularMoviesCollectionView.setContentOffset(.zero, animated: true)
            case .failure(let error):
                print(error)
            }
        }
        
        networkService.fetchPopularTV(with: networkService.urlTvShow) { [weak self] result in
            switch result {
            case .success(let model):
                self?.tvArray = self?.dtoTransformer.networkTvToDomainArray(with: model.results) ?? []
                self?.tvArray.shuffle()
                self?.mainView.tvShowCollectionView.reloadData()
                self?.mainView.tvShowCollectionView.setContentOffset(.zero, animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Private Functions
    
    private func goToItemController(with item: ItemModel) {
        let rootVC = ItemViewController()
        rootVC.itemModel = item
        self.navigationController?.pushViewController(rootVC, animated: true)
        navigationItem.backButtonTitle = "Back"
    }
}

// MARK: - Extension CollectionView Setup

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case mainView.popularMoviesCollectionView:
            return movieArray.count + 1
        case mainView.tvShowCollectionView:
            return tvArray.count + 1
        case mainView.continueWatchingCollectionView:
            if self.continueWatchingArray.isEmpty {
                return 1
            } else {
                return continueWatchingArray.count
            }
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellId,
                                                      for: indexPath)
        let lastCell = collectionView.dequeueReusableCell(withReuseIdentifier: lastCellId,
                                                          for: indexPath)
        guard let typedCell = cell as? CustomCell else { return cell }
        guard let typedLastCell = lastCell as? LastCell else { return lastCell}
        switch collectionView {
        case mainView.popularMoviesCollectionView:
            if indexPath.row < movieArray.count {
                typedCell.configureMovieCell(with: movieArray[indexPath.row])
                return typedCell
            } else {
                return typedLastCell
            }
        case mainView.tvShowCollectionView:
            if indexPath.row < tvArray.count {
                typedCell.configureMovieCell(with: tvArray[indexPath.row])
                return typedCell
            } else {
                return typedLastCell
            }
        case mainView.continueWatchingCollectionView:
            if self.continueWatchingArray.isEmpty {
                typedCell.configureEmptyCell()
                return typedCell
            } else {
                typedCell.configureMovieCell(with: continueWatchingArray[indexPath.row])
                return typedCell
            }
        default:
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case mainView.popularMoviesCollectionView:
            if indexPath.row < movieArray.count {
                goToItemController(with: movieArray[indexPath.row])
            } else {
                print("all movies here")
            }
        case mainView.tvShowCollectionView:
            if indexPath.row < tvArray.count {
                goToItemController(with: tvArray[indexPath.row])
            } else {
                print("all tv's are here")
            }
        case mainView.continueWatchingCollectionView:
            print("continue")
        default:
            return
        }
    }
}

// MARK: - Protocol Extenstion

extension MainViewController: MainViewProtocol {
    func didRefreshData() {
        fetchData()
    }
}
