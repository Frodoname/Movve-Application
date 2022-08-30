//
//  ViewController.swift
//  Movve
//
//  Created by Fed on 08.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var networkService = NetworkService()

    private lazy var movieArray: [MovieModel] = []
    private lazy var tvArray: [TvModel] = []
    private lazy var continueWatchingArray: [ContinueModel] = []

    private var mainView: MainView!

    private let customCellId = "customCellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setUpMainView()
        
        networkService.fetchPopularMovies(with: networkService.urlMovie) { result in
            switch result {
            case .success(let model):
                print(model.results)
            case .failure(let error):
                print(error)
            }
        }
    }

    func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:
                                                                            UIColor.white]
        title = "Movve"
        view.backgroundColor = UIColor(named: ColorScheme.backgroundColor)
    }

    func setUpMainView() {
        mainView = MainView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        view.addSubview(mainView)

        mainView.popularMoviesCollectionView.delegate = self
        mainView.popularMoviesCollectionView.dataSource = self
        mainView.tvShowCollectionView.delegate = self
        mainView.tvShowCollectionView.dataSource = self
        mainView.continueWatchingCollectionView.delegate = self
        mainView.continueWatchingCollectionView.dataSource = self
    }
}

// MARK: - Extensions

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case mainView.popularMoviesCollectionView:
            return 10 // movieArray.count
        case mainView.tvShowCollectionView:
            return 10 // tvArray.count
        case mainView.continueWatchingCollectionView:
            return 10 // continueWatchingArray.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCellId, for: indexPath)
        guard let typedCell = cell as? CustomCell else { return cell }
        switch collectionView {
        case mainView.popularMoviesCollectionView:
            return typedCell
        case mainView.tvShowCollectionView:
            return typedCell
        case mainView.continueWatchingCollectionView:
            return typedCell
        default:
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 200)
    }
}
